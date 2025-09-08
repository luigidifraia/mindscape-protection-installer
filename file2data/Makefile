# Project: file2data

CC   = gcc
OBJ  = file2data.o
LINKOBJ  = file2data.o
LIBS = -lm  
INCS =  
BIN  = file2data
CFLAGS = $(INCS) -lm -Wall -O3  
RM = rm -f

.PHONY: all all-before all-after clean clean-custom

all: all-before $(BIN) all-after

clean: clean-custom
	$(RM) $(OBJ) $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LINKOBJ) -o $(BIN) $(LIBS)

file2data.o: file2data.c
	$(CC) -c file2data.c -o file2data.o $(CFLAGS)
