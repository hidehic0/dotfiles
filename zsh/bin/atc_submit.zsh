#!/bin/zsh

DIR=$(basename $(pwd))
cd ..
acc_utils submit $DIR
