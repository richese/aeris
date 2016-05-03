SUBDIRS = common server visualisation null_bot prey_bot hunter_bot line ant_bot

# select optimalization compiler flags for all subdirs
OPTIM = -O2 -Os -s
#OPTIM = -g
export OPTIM

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@


.PHONY: $(SUBDIRS)


SRCS = $(shell find -name '*.cpp')
OBJS = $(SRCS:.cpp=.o)

ELFS = $(shell find -name '*.elf')

clean:
	rm $(OBJS) -rf
	rm $(ELFS) -rf
