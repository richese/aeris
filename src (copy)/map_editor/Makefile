ELF = bin/main.elf

COMMON_PATH = ../common

COMMON+= $(COMMON_PATH)/math.o
COMMON+= $(COMMON_PATH)/log.o
COMMON+= $(COMMON_PATH)/map.o

INC=-I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I. -I/usr/include/qt5 -I/usr/include/qt5/QtWidgets -I/usr/include/qt5/QtGui -I/usr/include/qt5/QtCore -I. -I.
LIBS=-lQt5Widgets -L/usr/lib/i386-linux-gnu -lQt5Gui -lQt5Core -lGL -lpthread

CC = g++
LD = g++
OBJCOPY = objcopy
OBJDUMP = objdump
SIZE = size

CFLAGS = -O2 -Os -s -Wall -Wextra -pedantic -std=c++0x $(INC) -fPIC
LDFLAGS = -lm -lpthread -pthread -std=c++0x $(LIBS)

SRCS = $(shell find -name '*.cpp')

OBJS = $(SRCS:.cpp=.o)

OBJS+= $(COMMON)
 
all: $(ELF)
	$(SIZE) $(ELF)

$(ELF): $(OBJS)
	$(LD) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.cpp commands
	$(CC) -c $(CFLAGS) $< -o $@ 

clean:
	rm $(OBJS) -rf


commands:
	cp ../map_editor_qt/build-map_editor-Desktop-Debug/ui_mainwindow.h .
	cp ../map_editor_qt/build-map_editor-Desktop-Debug/moc_mainwindow.cpp .
	cp ../map_editor_qt/map_editor/mainwindow.h .
	cp ../map_editor_qt/map_editor/mainwindow.cpp .
