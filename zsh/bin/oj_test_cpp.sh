#!/bin/zsh
g++ main.cpp -I$HOME/src/github.com/hidehic0/library_cpp
oj t -c "./a.out" -d tests
