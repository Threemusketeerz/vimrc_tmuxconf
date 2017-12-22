#!/bin/bash

cp -i ~/$1 .
cp -i ~/$2 .

git add -A
git commit -m 'Upload by script' 
git push upstream master
