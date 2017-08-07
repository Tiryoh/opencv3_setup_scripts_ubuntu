# Makefile
# Copyright (c) 2016 Tiryoh <tiryoh@gmail.com>
# 
# This software is released under the MIT License.
#
.PHONY: all clean rebuild

CC :=g++
CFLAGS :=-Wall -std=c++11 `pkg-config opencv --cflags`
LDFLAGS :=`pkg-config opencv --libs`
SOURCES :=$(wildcard *.cpp)
EXECUTABLE :=$(SOURCES:.cpp=.out)

all:$(EXECUTABLE)

$(EXECUTABLE):$(SOURCES)
	$(CC) $(@:.out=.cpp) $(LDFLAGS) $(CFLAGS) -o $@

clean:
	rm -rf $(EXECUTABLE)

rebuild:clean all
