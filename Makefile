# Check the operating system
UNAME := $(shell uname)

# Only proceed if the system is Linux
ifeq ($(UNAME), Linux)

CC = g++
CFLAGS = -Wall
LDFLAGS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
SRC_DIR = ./src
BUILD_DIR = ./build
EXECUTABLE = game

# List your source files here
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# Create the build directory if it doesn't exist
$(shell mkdir -p $(BUILD_DIR))

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/$@ $^ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/$(EXECUTABLE)

.PHONY: all clean

else
# If the system is not Linux, display an error message
$(error This Makefile is intended for Linux only)

endif
