#!/bin/zsh
cur_branch=$(git branch --contains | cut -d " " -f 2)

echo "The branch to pull is $cur_branch"

git pull origin $cur_branch
