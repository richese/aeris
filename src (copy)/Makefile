SUBDIRS = common main map_editor

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
