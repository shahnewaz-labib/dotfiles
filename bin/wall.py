#!/bin/python

import os, random

DIR="/home/labib/Wallpapers/"

FILE=random.choice(os.listdir(DIR))
FILE=DIR+FILE
print(FILE)
os.system("nitrogen --set-zoom-fill " + FILE)
