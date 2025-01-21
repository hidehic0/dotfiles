#!/bin/zsh
cur_branch=$(git branch --contains | cut -d " " -f 2)

echo "Branches to push are $cur_branch"

git push origin $cur_branch
