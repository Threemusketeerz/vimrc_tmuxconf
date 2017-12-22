#!/bin/bash

url=https://github.com/threemusketeerz/vimrc

cp -i $1 confs_for_git_push/
cp -i $2 confs_for_git_push/

if [[ ! -e .git ]]; then
    printf '.git not found creating git rep'
    git init
    git remote add origin $url
fi

git add -A
git commit -m 'Upload by script' 
git remote origin master
