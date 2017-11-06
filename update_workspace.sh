#! /bin/bash

# scripts repo
printf "updating SocRob repositories...\n\n --- scripts ---"
cd $HOME/scripts && git pull origin master

# main repositories
printf "\n\n --- isr_monarch_robot ---"
cd $ROS_WORKSPACE/isr_monarch_robot && git pull origin kinetic
printf "\n\n --- mbot_drivers ---\n\n"
cd $ROS_WORKSPACE/mbot_drivers && git pull origin kinetic
printf "\n\n --- cyton_gamma_1500_description ---\n\n"
cd $ROS_WORKSPACE/cyton_gamma_1500_description && git pull origin custom-gripper
printf "\n\n --- mbot_description ---\n\n"
cd $ROS_WORKSPACE/mbot_description && git pull origin kinetic
printf "\n\n --- robocup-at-work ---\n\n"
cd $ROS_WORKSPACE/robocup-at-work && git pull origin kinetic
printf "\n\n --- speech_recognition ---\n\n"
cd $ROS_WORKSPACE/mbot_natural_language_processing && git pull origin kinetic
printf "\n\n --- unmerged_packages_for_testing ---\n\n"
cd $ROS_WORKSPACE/unmerged_packages_for_testing && git pull origin kinetic

# only for specific computers

# simulation repos only on harode server
if [ $(hostname) == "harode-server" ] ; then
    printf "\n\n --- mbot_simulation ---\n\n"
    cd $ROS_WORKSPACE/mbot_simulation && git pull origin kinetic
    printf "\n\n --- mbot_simulation_environments ---\n\n"
    cd $ROS_WORKSPACE/mbot_simulation_environments && git pull origin kinetic
fi

# only for the robot PC
if [ $(hostname) == "mbot05n" ] ; then
    # task planning
    printf "\n\n --- isr_planning ---\n\n"
    cd $ROS_WORKSPACE/isr_planning && git pull origin kinetic
    
    # people following repos
    printf "\n\n --- bayes_people_tracker ---\n\n"
    cd $ROS_WORKSPACE/bayes_people_tracker && git pull origin kinetic
    printf "\n\n --- bayestracking ---\n\n"
    cd $ROS_WORKSPACE/bayestracking && git pull origin kinetic
    printf "\n\n --- HumanAwareness ---\n\n"
    cd $ROS_WORKSPACE/HumanAwareness && git pull origin kinetic
    printf "\n\n --- spencer_people_tracking ---\n\n"
    cd $ROS_WORKSPACE/spencer_people_tracking && git pull origin master
fi

# source personal configuration file (if it exists)
PERSONAL_CONFIG_FILE=$HOME/scripts/personal_config/update_workspace.sh
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE

printf "\n\n --- All done ! Ciao ---\n\n"

# go to the source of your workspace
cd $ROS_WORKSPACE
