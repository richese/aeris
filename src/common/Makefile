CC = g++
LD = g++

OBJCOPY = objcopy
OBJDUMP = objdump
SIZE = size

CFLAGS = -Wall -Wextra -pedantic -std=c++0x
CFLAGS += $(OPTIM)
LDFLAGS = -lm -lpthread -pthread -std=c++0x



SRCS = $(shell find -name '*.cpp')
OBJS = $(SRCS:.cpp=.o)

all: $(OBJS)

%.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm $(OBJS) -rf
