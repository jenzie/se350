#!/usr/bin/make
#
# Makefile for test_pointers
#
# Author: Jenny Zhen

test_pointers: test_pointers.o
	gcc test_pointers.o -o test_pointers

test_pointers.o: main.c
	gcc -c main.c

clean:
	rm -f *~ *.o test_pointers

run:
	./test_pointers