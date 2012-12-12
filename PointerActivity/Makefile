#!/usr/bin/make
#
# Makefile for test_pointers
#
# Author: Jenny Zhen
#
# To Run:
# make
# make run
# W$1349$1.414$
# Ctrl + D

test_pointers: test_pointers.o
	gcc main.o read_data.o -o test_pointers

test_pointers.o: main.c read_data.c read_data.h
	gcc -c main.c read_data.c

clean:
	rm -f *~ *.o test_pointers

run:
	./test_pointers