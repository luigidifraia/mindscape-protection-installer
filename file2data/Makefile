# Project: file2data

CC   = gcc
RES  = 
OBJ  = file2data.o $(RES)
LINKOBJ  = file2data.o $(RES)
LIBS = -lm  
INCS =  
BIN  = file2data
CFLAGS = $(INCS) -lm -Wall -O3  
RM = rm -f

.PHONY: all all-before all-after clean clean-custom

all: all-before file2data all-after


clean: clean-custom
	${RM} $(OBJ) $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LINKOBJ) -o "file2data" $(LIBS)

file2data.o: file2data.c
	$(CC) -c file2data.c -o file2data.o $(CFLAGS)
