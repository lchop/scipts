#!/bin/bash

# recommended programs for fresh ubuntu installations
#----------------------------------------------------

# create list of packages to install
aptpackagelist=(
    ipython           # python console editor
    vim               # terminal text editor
    exfat-fuse        # to acces exfat hard drives
    xbacklight        # to dim light of the monitor
    git-core          # git
    gitg              # git gui
    gitk              # git gui
    terminator        # terminal with split windows option
    kate              # kde text editor
    tree              # draw (print) folder structure from terminal
    python-pygments   # to cat files in colors
    konsole           # kde terminal with search options
    guake             # fancy drop down terminal
    geany             # text editor
    wmctrl            # to maximize a terminal from cmd line
    python-pip        # to install pip
    python-pandas     # pandas is an open source library easy-to-use data structures and data analysis tools for Python
)

pippackagelist=(
    keras             #Keras is a high-level neural networks API to run  top of TensorFlow, CNTK, or Theano
    statistics        #This module provides functions for calculating mathematical statistics of numeric in python
)

### install debian packages listed in array above
sudo apt-get install -y ${aptpackagelist[@]}

sudo pip install -y ${pippackagelist[@]}