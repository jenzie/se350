#!/usr/bin/make
#
# Makefile for grade_list
#
# Author: Jenny Zhen

grade_list: grade_list.o
	gcc grade_list.o -o grade_list

grade_list.o: grade_list.c
	gcc -c grade_list.c

clean:
	rm -f *~ *.o grade_list

run:
	./grade_list grades.txt