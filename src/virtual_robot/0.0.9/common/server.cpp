#include "server.h"

#include <sys/socket.h>
#include <netinet/in.h> 
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <time.h> 

extern struct sVisualisation g_visualisation;


CServer::CServer()
{ 
    cfg_load((char*)CFG_FILE_NAME);

    server_id = cfg_get_id();

    printf("\n\n");
    printf(" address: %s port : %i id %lu\n", cfg_get_server_name(), cfg_get_port(), (long unsigned int)server_id);
    debug_log_add((char*)"server init done");

    print_time = 0.0;
    dt = 10.0;
    time = 0.0;
    time_refresh = 0.0;

    position_max = 250.0;

    u32 width = 1024;
    u32 height = 768;

    #ifdef VISUALISATION_IN_SERVER

    g_visualisation.window_width = width; 
    g_visualisation.window_height = height;   
 
    g_visualisation.size = 32.0; 
    g_visualisation.ratio = 0.03;

    g_visualisation.position_max_x = width;
    g_visualisation.position_max_y = height;
    g_visualisation.position_max_z = 2.0;

    visualisation_init();

    #endif

    map = NULL;

    map = new CMap(0, 0, 34, 19, 55.0, 55.0);

    if (map->load((char*)"map_targets.txt") == 0)
    {
        printf("map success loaded\n");
    }
    else
    {
        printf("map loading failed\n");
    }


    #ifdef ROBOTS_IN_SERVER
    init_robots(32);
    #endif
 
    this->printing_thread = new std::thread(&CServer::print, this);

    debug_log_add((char*)"server start sucess");
}

CServer::~CServer()
{ 
    delete this->printing_thread;
    delete this->map;

    debug_log_add((char*)"server uninit done");
}

i32 CServer::main()
{
    #ifdef ROBOTS_IN_SERVER
    return main_local();
    #else
    return main_remote();
    #endif 
}

i32 CServer::main_local()
{
    u32 run = 1;

    while (run)
    {
        this->time = get_ms_time();

        if (this->time > this->time_refresh)
        {
            u32 j;

            for (j = 0; j < c_robots.size(); j++)
                c_robots[j]->process(&robots[j]);
        }

        if (this->time > (this->time_refresh + dt))
            debug_log_add((char*)"real time error");

        robots_refresh();
    }

    return 0;
}

i32 CServer::main_remote()
{ 
    debug_log_add((char*)"server main start");

    int portno = cfg_get_port();

    server_listen_fd = 0;

    struct sockaddr_in serv_addr; 
 
    server_listen_fd = socket(AF_INET, SOCK_STREAM, 0);

    if (server_listen_fd < 0)
        return -3; 

    memset(&serv_addr, '0', sizeof(serv_addr));

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    serv_addr.sin_port = htons(portno); 

    if (bind(server_listen_fd, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0)
        return -4;
 
    if (listen(server_listen_fd, 10) < 0)
        return -5;

    struct sRobot rx_data, tx_data;
    u32 ResultDataSize = sizeof(struct sRobot);

    u32 run = 1;

    while (run)
    {
        this->time = get_ms_time();

        struct sockaddr_in client;
        int c = sizeof(struct sockaddr_in);

        int connfd = accept(server_listen_fd, (struct sockaddr *)&client, (socklen_t*)&c);

        if (connfd < 0)
            return -6;

       if (read(connfd, (u8*)(&rx_data), ResultDataSize) < 0)
            exit(-8);

        process_data(&rx_data, &tx_data);

        if (write(connfd, (u8*)(&tx_data), ResultDataSize) < 0)
            exit(-9);

        close(connfd);

        robots_refresh();
    }

    return 0;
}

void CServer::robots_refresh()
{
        u32 i, j;
 
        /*check for refresh time*/
        if (this->time > this->time_refresh)
        {
            this->time_refresh = this->dt + get_ms_time();
 
            for (j = 0; j < robots.size(); j++)
            {
                switch (robots[j].request)
                {
                    case REQUEST_ROBOT_RESPAWN:
                            respawn(&robots[j]);
                            break;

                    default:
                            if (robots[j].type&ROBOT_MOVEABLE_FLAG)
                            {
                                update_position(j);
                                update_sensors(j);
                            }
                            break;
                }

                robots[j].request = REQUEST_NULL;
            }

            #ifdef VISUALISATION_IN_SERVER
            for (j = 0; j < robots.size(); j++)
                visualisation_update(robots[j]);
            #endif
        }
}

void CServer::process_data(struct sRobot *rx_data, struct sRobot *tx_data)
{
    u32 i, j;

    bool robot_updated = false;
    for (i = 0; i < robots.size(); i++)
        if (robots[i].id == rx_data->id)
        {
            robots[i] = *rx_data;
            robot_updated = true;
            break;
        }

    /*new robot connected*/
    if (robot_updated != true)
    {
        respawn(rx_data);
        robots.push_back(*rx_data);
        
        debug_log_add((char*)"new robot connected");
    }

    u32 idx = i;

    robots[idx].dt = dt;
    robots[idx].time = this->time;

    if (robots[idx].request == REQUEST_ROBOT_RESPAWN)
        respawn(&robots[idx]);

    
    //send robot state/data with idx in parameter
    if (rx_data->request == REQUEST_ROBOT_DATA)
    {
        idx = rx_data->parameter;
        if (idx < robots.size())
        {
            *tx_data = robots[idx];
            tx_data->request = REQUEST_ROBOT_SUCESS;
        } 
        else
        {
            tx_data->request = REQUEST_ROBOT_FAILED;  
            tx_data->type = ROBOT_TYPE_NULL;  
        }
    }
    else
    //send back to same robot answer with updated state
    if (rx_data->request == REQUEST_NULL)
    {
        *tx_data = robots[idx];
    } 
}


void CServer::print()
{   
    u32 j, i;

    while (1)
    {
        for (j = 0; j < robots.size(); j++)
        {
            if ((robots[j].type&ROBOT_MOVEABLE_FLAG) != 0)
            {
                printf("%lu %u %f:\n", (long unsigned int)robots[j].id, robots[j].type, robots[j].time);
                
                printf("[ ");
                for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
                    printf("%6.3f ", robots[j].position[i]);
                printf(" ]");
                printf("\n");


                printf("[");
                for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
                    printf("%6.3f ", robots[j].sensors[i]);
                printf(" ]");
                printf("\n");

                /*

                u32 i;            
                printf("     ");
                for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
                    printf("%6.3f ", robots[j].position[i]);
                printf("\n");

                printf("     ");
                for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
                    printf("%6.3f ", robots[j].sensors[i]);
                printf("\n");
                printf("\n");

                */
            }
        }
        
        printf("\n");
        usleep(1000*1000);
    }
}


void CServer::respawn(struct sRobot *robot)
{
    std::vector<float> position;
    
    u32 i, j;
    
    for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
        position.push_back(0.0);

    float dist_min;
    do
    {
        /*
        for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
            position[i] = rnd_()*200.0;
        */

        for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
            position[i] = rnd_()*position_max*0.8;


        dist_min = 99999999999999999999.9;
        for (j = 0; j < robots.size(); j++)
        {
            float dist = 0.0;
            for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
                dist+= abs_(position[i] - robots[j].position[i]);

            if (dist < dist_min)
                dist_min = dist;
        }
    }
        while (dist_min < 16.0);


    for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
        robot->position[i] = position[i];
}



void CServer::init_robots(u32 robots_count)
{
    struct sRobot robot;

    u32 j, i;

    u32 robot_id = 0;

    if (map != NULL)
    {
        u32 x, y;
        for (y = 0; y < map->get_height(); y++)
            for (x = 0; x < map->get_width(); x++)
            {
                struct sMapField field;
                field = map->get_at(x, y);   

                if (field.type != MAP_FIELD_TYPE_EMPTY)
                {
                    u32 robot_type = ROBOT_TYPE_WALL;

                    switch (field.type)
                    {
                        case MAP_FIELD_TYPE_WALL: robot_type = ROBOT_TYPE_WALL; break;
                        case MAP_FIELD_TYPE_PATH: robot_type = ROBOT_TYPE_PATH; break;
                        case MAP_FIELD_TYPE_TARGET: robot_type = ROBOT_TYPE_TARGET; break;
                        case MAP_FIELD_TYPE_SOURCE: robot_type = ROBOT_TYPE_SOURCE; break;
                        case MAP_FIELD_TYPE_DESTINATION: robot_type = ROBOT_TYPE_DESTINATION; break;

                        case MAP_FIELD_TYPE_RED_ROBOT: robot_type = ROBOT_TYPE_RED_ROBOT; break;
                        case MAP_FIELD_TYPE_RED_TARGET: robot_type = ROBOT_TYPE_RED_TARGET; break;
                        case MAP_FIELD_TYPE_RED_PATH: robot_type = ROBOT_TYPE_RED_PATH; break;

                        case MAP_FIELD_TYPE_GREEN_ROBOT: robot_type = ROBOT_TYPE_GREEN_ROBOT; break;
                        case MAP_FIELD_TYPE_GREEN_TARGET: robot_type = ROBOT_TYPE_GREEN_TARGET; break;
                        case MAP_FIELD_TYPE_GREEN_PATH: robot_type = ROBOT_TYPE_GREEN_PATH; break;

                        case MAP_FIELD_TYPE_BLUE_ROBOT: robot_type = ROBOT_TYPE_BLUE_ROBOT; break;
                        case MAP_FIELD_TYPE_BLUE_TARGET: robot_type = ROBOT_TYPE_BLUE_TARGET; break;
                        case MAP_FIELD_TYPE_BLUE_PATH: robot_type = ROBOT_TYPE_BLUE_PATH; break;
                    }
                    
            
                    robot.id = cfg_get_id() + robot_id + 1;
                    robot.type = robot_type;
                    robot.request = REQUEST_NULL;
                    robot.parameter = 0;

                    robot.dt = this->dt;   //dt in ms
                    robot.time = 0.0;

                    robot_id++;

                    for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
                        robot.sensors[i] = 0.0;

                    for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
                    {
                        robot.d[i] = 0.0;
                        robot.position[i] = 0.0;
                        robot.angles[i] = 0.0;
                    }

                    float x = (1.0*field.position[0]/map->get_width() - 0.5)*2.0;
                    float y = (1.0*field.position[1]/map->get_height() - 0.5)*2.0*9/16.0;

                    robot.position[0] = position_max*x;
                    robot.position[1] = position_max*y;

                    //rnd_()*position_max*0.8

           
                    //     respawn(&robot);

                    robots.push_back(robot);
                    c_robots.push_back(new CRobotBrain(robot));  
                }
            }

    }

    for (j = 0; j < robots_count; j++)
    {
        u32 robot_type = ROBOT_TYPE_NULL;

        //if ((j%5) == 0)
            robot_type = ROBOT_TYPE_COMMON;
        //else
          //  robot_type = ROBOT_TYPE_TARGET;

        robot.id = cfg_get_id() + robot_id + 1;
        robot.type = robot_type;
        robot.request = REQUEST_NULL;
        robot.parameter = 0;

        robot.dt = this->dt;   //dt in ms
        robot.time = 0.0;

        robot_id++;

        for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
            robot.sensors[i] = 0.0;

        for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
        {
            robot.d[i] = 0.0;
            robot.position[i] = 0.0;
            robot.angles[i] = 0.0;
        }

        respawn(&robot);

        robots.push_back(robot);
        c_robots.push_back(new CRobotBrain(robot));
    }

    debug_log_add((char*)"local robots init done");
}



void CServer::update_position(u32 robot_idx)
{
    u32 i;
    for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
    {
        robots[robot_idx].position[i]+= robots[robot_idx].d[i];
        robots[robot_idx].position[i] = saturate(robots[robot_idx].position[i], -position_max, position_max);
    }
}


void CServer::update_sensors(u32 robot_idx)
{
    u32 j, i;

    /*update target distance sensor*/
    i32 dist_min_idx = -1;
    float dist_max_value = sqrt(ROBOT_SPACE_DIMENSION*position_max*position_max);
    float dist_min_value = dist_max_value;

    
    for (j = 0; j < robots.size(); j++)
    {
        if (robots[j].type == ROBOT_TYPE_TARGET)
        {
            float sum = 0.0;
            for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
            {
                float tmp;

                tmp = robots[robot_idx].position[i] - robots[j].position[i];
                sum+= tmp*tmp;
            }

            sum = sqrt(sum);

            if (sum < dist_min_value)
            {
                dist_min_value = sum;
                dist_min_idx = j;
            }
        }
    }

    dist_min_value = dist_min_value/dist_max_value;

    robots[robot_idx].sensors[ROBOT_SENSOR_TARGET_DISTANCE_IDX] = dist_min_value;

    if (dist_min_idx == -1)
        return;

    std::vector<float> way_vector;

    for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
        way_vector.push_back(robots[dist_min_idx].position[i] - robots[robot_idx].position[i]);


    if (ROBOT_SPACE_DIMENSION == 1)
    {
        robots[robot_idx].sensors[ROBOT_SENSOR_TARGET_ANGLE_0_IDX] = atan2(way_vector[0], 0.0);
    }

    if (ROBOT_SPACE_DIMENSION == 2)
    {
        robots[robot_idx].sensors[ROBOT_SENSOR_TARGET_ANGLE_0_IDX] = atan2(way_vector[1], way_vector[0]);
    }

}