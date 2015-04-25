#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "math.h"


float saturate(float value, float min, float max)
{
    if (value < min)
        value = min;

    if (value > max)
        value = max;

    return value;
}
 




void vect_init(struct sVector *vector, u32 size)
{
    vector->points = (float*)malloc(size*sizeof(float));
    vector->size = size;
    u32 i;
    for (i = 0; i < vector->size; i++)
        vector->points[i] = 0.0;
}

void vect_uninit(struct sVector *vector)
{
    if (vector->points != NULL)
    {
        free(vector->points);
        vector->points = NULL;
        vector->size = 0;
    }
}

float vect_size(struct sVector *vector)
{
    u32 i;
    float sum = 0.0;
    for (i = 0; i < vector->size; i++)
    {
        sum+= vector->points[i]*vector->points[i];
    }
    return sqrt(sum);
}

void vect_add(struct sVector *vector_res, struct sVector *vector_a, struct sVector *vector_b)
{
    u32 i;
    for (i = 0; i < vector_res->size; i++)
    {
        vector_res->points[i] = vector_a->points[i] + vector_b->points[i];
    }
}

void vect_copy(struct sVector *vector_dest, struct sVector *vector_src)
{
    u32 i;
    for (i = 0; i < vector_dest->size; i++)
    {
        vector_dest->points[i] = vector_src->points[i];
    }   
}

float vect_size_2d(float a, float b)
{
    return sqrt(a*a + b*b);
}

float rand_()
{
    i32 tmp = (rand()%1000000); 
    
    return tmp/1000000.0;
}

float rnd_()
{
    i32 tmp = (rand()%2000000) - 1000000; 
    
    return tmp/1000000.0;
}

float tan_(float x, float y)
{
    float pi = 3.141592654;

    float x_ = x;
    float y_ = y; 

    if (x_ < 0.0)
        x_ = -x_;

    if (y_ < 0.0)
        y_ = -y_;


    if (x_ == 0.0)
    {
        x_ = 0.0000001;
    }

    float res = tan(y_/x_);


    if ((x > 0.0) && (y < 0.0))
        res+= pi;
    
    if ((x < 0.0) && (y < 0.0))
        res+= 2*pi;
    
    if ((x > 0.0) && (y < 0.0))
        res-= pi/4.0;
 
 
    return res;
}


float atan_(float x, float y)
{
    float angle = 0.0;

    if (x >= 0.0)
    {
        if (y >= 0.0)
        {
            if (x == 0.0)
                x = 0.00001;
            angle = PI/2.0 + atan(y/x);
        }
        else
        {
            if (x == 0.0)
                x = 0.00001;
            angle = PI/2.0 + atan(y/x);
        }
    }
    else
    {
        if (y >= 0.0)
        {
            if (x == 0.0)
                x = 0.00001;
            angle = -(PI/2.0 - atan(-y/-x));
        }
        else
        {
            if (x == 0.0)
                x = 0.00001;
            angle = -(PI/2.0 - atan(-y/-x));
        }
    }

    /*
    if (x >= 0.0)
    {
        if (y >= 0.0)
        {
            if (x == 0.0)
                x = 0.00001;
            angle = PI/2.0 + atan(y/x);
        }
        else
        {
            if (x == 0.0)
                x = 0.00001;
        angle = -PI/2.0 + atan(y/x);  
        }
    }
    else
    {
        if (y >= 0.0)
        {
            if (x == 0.0)
                x = 0.00001;
            angle = -PI/2.0 + atan(y/x);
        }
        else
        {
            if (x == 0.0)
                x = 0.00001;
            angle = PI/2.0 + atan(y/x);
        }
    }
    */

    return angle;
}


float min(float a, float b)
{
	if (a < b)
		return a;
	return b;
}

float max(float a, float b)
{
	if (a > b)
		return a;
	return b;
}

float min_array(float *values, u32 size)
{
    u32 i;
    float res = values[0];

    for (i = 1; i < size; i++)
        if (values[i] < res)
            res = values[i];

    return res;
}

float max_array(float *values, u32 size)
{
    u32 i;
    float res = values[0];

    for (i = 1; i < size; i++)
        if (values[i] > res)
            res = values[i];

    return res;
}


float abs_(float a)
{
    if (a < 0.0)
        return -a;
    return a;
}

float sgn(float a)
{
    if (a > 0.0)
        return 1.0;

    if (a < 0.0)
        return -1.0;

    return 0.0;
}

float angle_modulo(float angle)
{
    i32 tmp = (10000*angle)/(2.0*PI);

    tmp = tmp%10000;

    angle = 2.0*PI*tmp/10000.0;

    if (angle < 0.0)
        angle = 2.0*PI + angle;

        

    return angle;
}


void rotate_point(float *x_res, float *y_res, float x, float y, float angle)
{
    *x_res = x*cos(angle) - y*sin(angle);
    *y_res = x*sin(angle) + y*cos(angle);
}


float point_from_line_distance(float px, float py, float x0, float y0, float x1, float y1)
{
    float res = 0.0;

    float dx = x1 - x0;
    float dy = y1 - y0;

    res = dy*px - dx*py - x0*y1 + x1*y0;
    if (res < 0.0)
        res = -res;

    res/= sqrt(dx*dx + dy*dy); 

    return res;
}


void line_intersection( float *xr, float *yr,
                        float x1, float y1, float x2, float y2,
                        float x3, float y3, float x4, float y4 )
{ 
    float tmp;
 

    tmp = (x1 - x2)*(y3 - y4) - (y1 - y2)*(x3 - x4);

    *xr = ((x1*y2 - y1*x2)*(x3 - x4) - (x1 - x2)*(x3*y4 - y3*x4))/tmp;

    *yr = ((x1*y2 - y1*x2)*(y3 - y4) - (y1 - y2)*(x3*y4 - y3*x4))/tmp;
}


u32 ray_in_sphere(float xd, float x0, float yd, float y0, float xc, float yc, float r)
{
    float a = xd*xd + yd*yd;
    float b = 2.0*(xd*(x0 - xc) + yd*(y0 - yc));
    float c = (x0 - xc)*(x0 - xc) + (y0 - yc)*(y0 - yc) - r*r;

    float det = b*b - 4.0*a*c;

    if (det >= 0.0)
        return 1;

    return 0;
}

float fast_tanh(float x)
{
    return x/(1.0 + abs_(x));
}


/*
    result == 0 - tangent
    result > 0.0 intersection
    result < 0.0 no intersection

    http://mathworld.wolfram.com/Circle-LineIntersection.html
*/
float line_circle_intersection(float x1, float y1, float x2, float y2, float xc, float yc, float r)
{
    x1-= xc;
    y1-= yc;

    x2-= xc;
    y2-= yc;

    float dx = x2 - x1;
    float dy = y2 - y1;
    float dr = sqrt(dx*dx + dy*dy);

    float det = x1*y2 - x2*y1;

    float disc = r*r*dr*dr - det;

    return disc;
}