#! /bin/bash

printf "\n\n --- mbot_simulation ---\n\n"
cd $ROS_WORKSPACE/mbot_simulation && git pull origin kinetic

printf "\n\n --- mbot_simulation_environments ---\n\n"
cd $ROS_WORKSPACE/mbot_simulation_environments && git pull origin kinetic

printf "\n\n --- isr_planning ---\n\n"
cd $ROS_WORKSPACE/isr_planning && git pull origin kinetic
