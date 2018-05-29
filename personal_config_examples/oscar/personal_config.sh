#!/bin/sh

# to configure external mac german layout keyboard
alias mackey='source ~/scripts/personal_config/external_mac_german_keyboard_layout.sh'

# easily push to socrob repos
alias push='git push origin kinetic'

# enable programs to be searched from any terminal
export PATH=$PATH:~/Software/simlinks

# set by default the robot to have arm
export ROBOT=mbot05-with-arm

# robot environment set to simulation by default
export ROBOT_ENV=isr-testbed-sim

# rosed with kate instead of vim
export EDITOR=kate

# to work with the simulator in harode
alias export_harode_oscar='export DISPLAY=:0 && export ROS_MASTER_URI=http://$HARODE_IP:11324 && export GAZEBO_MASTER_URI=http://$HARODE_IP:11358' # needs to be runned on harode
alias roscore_harode_oscar='export_harode_oscar && roscore -p 11324' # needs to be runned on harode
alias rviz_harode_oscar='export_harode_oscar && rviz'
alias gzclient_harode_oscar='export_harode_oscar && rosrun gazebo_ros gzclient'

# ros workspace, choose only one:

# source SocRob workspace
export ROS_WORKSPACE=~/ros_ws/monarch_ws/src
