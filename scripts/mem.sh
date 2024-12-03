#!/usr/bin/env bash

list=$(find -maxdepth 1)
shopt -s dotglob
for i in *; do
    echo $(du -sh ./$i)
done
