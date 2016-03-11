ELF = bin/visualisation.elf

COMMON_PATH = ../../../common
COMMON_VIRTUAL_ROBOT_PATH = ../common

COMMON+= $(COMMON_PATH)/debug_log.o
COMMON+= $(COMMON_PATH)/time.o
COMMON+= $(COMMON_PATH)/getch.o
COMMON+= $(COMMON_PATH)/math.o
COMMON+= $(COMMON_PATH)/map.o


COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/load_cfg.o
COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/server.o
COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/client.o

COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/visualisation_gl.o

COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/robot.o
COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/robot_brain.o
COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/collective_brain.o
COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/action.o
COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/q_learning.o

COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/pheromone_brain.o

COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/robot_red_brain.o
COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/robot_green_brain.o
COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/robot_blue_brain.o

COMMON+= $(COMMON_VIRTUAL_ROBOT_PATH)/robot/path_brain.o


CC = g++
LD = g++
OBJCOPY = objcopy
OBJDUMP = objdump
SIZE = size

CFLAGS = -O2 -Os -s -Wall -Wextra -pedantic -std=c++0x
LDFLAGS = -lm -lpthread -std=c++0x -lglut -lGL -lGLU

SRCS = $(shell find -name '*.cpp')

OBJS = $(SRCS:.cpp=.o)

OBJS+= $(COMMON)

all: $(ELF)
	$(SIZE) $(ELF)

$(ELF): $(OBJS)
	$(LD) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm $(OBJS) -rf
