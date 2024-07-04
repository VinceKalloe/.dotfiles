#!/bin/bash
export d=$(pwd | awk -F '/' '{print ".config/"$7"/"}') ; mkdir -p $d ; ls -a | awk '{system("mv "$1" ./"ENVIRON["d"]"/"$1)}';
