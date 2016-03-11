ELF = bin/main.elf

 
CC = g++
LD = g++
OBJCOPY = objcopy
OBJDUMP = objdump
SIZE = size

CFLAGS = -O2 -Os -s -Wall -Wpedantic -Wextra -pedantic -pthread -std=c++11
LDFLAGS = -lm -lpthread -pthread -std=c++11 -pedantic -O2 -Os -s

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
	rm $(ELF) -rf
