#!/bin/sh

# you can source other scripts from here as well...
alias mackey='source ~/scripts/personal_config/external_mac_german_keyboard_layout.sh'

# robot environment set to simulation by default
export ROBOT_ENV=isr-testbed-sim

# rosed with kate instead of vim
export EDITOR=kate

# my ws is not in default location: /home/oscar/ros_ws, therefore I need to add this line
export ROS_WORKSPACE=~/ros_ws/monarch_ws/src
