ELF = bin/main.elf

COMMON_PATH = ../common

COMMON+= $(COMMON_PATH)/math.o
COMMON+= $(COMMON_PATH)/log.o
COMMON+= $(COMMON_PATH)/robot_container.o



CC = g++
LD = g++
OBJCOPY = objcopy
OBJDUMP = objdump
SIZE = size

CFLAGS = -O2 -Os -s -Wall -Wextra -pedantic -std=c++0x
LDFLAGS = -lm -lpthread -pthread -std=c++0x

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
