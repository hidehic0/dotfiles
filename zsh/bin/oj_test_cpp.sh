#!/bin/zsh
g++ main.cpp -I$HOME/src/github.com/hidehic0/library_cpp -std=gnu++23
oj t -c "./a.out" -d tests
