# Makefile for linked list testing using simplectest
# Tom Reichlmayr, RIT, 12/18/2006

linkedtest: linked.o linkedtest.o 
	gcc -Wall linked.o linkedtest.o -o linkedtest
	./linkedtest

linked.o: linked.h linked.c
	gcc -Wall -c linked.c

linkedtest.o: linked.h linkedtest.c
	gcc -Wall -c linkedtest.c
