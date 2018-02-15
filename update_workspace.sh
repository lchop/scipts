#! /bin/bash

# store the current user location (current directory pwd)
current_user_dir=$(pwd)

# function to inform the user if there is uncommited stuff
function is_there_pending_git_jobs_test()
{
    # NOTE: this function does not take arguments

    # do git status and check if there are pending git jobs: modified files or untracked, etc.
    if [[ $(git status -s) ]]; then
        # echo 'WARNING: you have pending git jobs!' in yellow color:
        YELLOW='\033[1;33m'
        NC='\033[0m' # No Color
        printf "${YELLOW}WARNING: you have pending git jobs!${NC}\n"
    fi
}

# function to check if your current branch is set to the one that you try to pull
# i.e. my repo is in "test" branch, I might not want to pull "kinetic" into "test"...
function safe_pull()
{
    # args : 1. remote, 2. branch

    # find out the current branch (filters out the * and other branches)
    current_branch="$(git branch | grep \* | cut -d ' ' -f2)"

    # if you are on x branch name and you want to pull from x then allow, otherwise do nothing
    if [ "${current_branch}" == $2 ]; then
        # is safe to pull (requested branch is same with actual repo branch), so pulling
        git pull $1 $2
    else
        # warn the user about the fact that he tried to pull from x but he is currently in branch y, therefore doing nothing
        RED='\033[0;31m'
        NC='\033[0m' # No Color
        printf "${RED}ERROR: is not safe to pull, you requested to pull from \"$2\" but your repo is in branch \"$current_branch\", doing nothing...${NC}\n"
    fi
}

# function to change into the desired repo and then git pull
function update_repo()
{
    # args : 1. repo name, 2. remote, 3.branch
    cd $ROS_WORKSPACE/$1 && safe_pull $2 $3 && is_there_pending_git_jobs_test
}

# scripts repo
printf "updating SocRob repositories...\n\n --- scripts ---"
cd $HOME/scripts && git pull origin master && is_there_pending_git_jobs_test

# main repositories
printf "\n\n --- isr_monarch_robot ---"
update_repo isr_monarch_robot origin kinetic

printf "\n\n --- mbot_drivers ---\n\n"
update_repo mbot_drivers origin kinetic
printf "\n\n --- cyton_gamma_1500_description ---\n\n"
update_repo cyton_gamma_1500_description origin tec-gripper
printf "\n\n --- mbot_description ---\n\n"
update_repo mbot_description origin kinetic
printf "\n\n --- robocup-at-work ---\n\n"
update_repo robocup-at-work origin kinetic
printf "\n\n --- mbot natural language processing ---\n\n"
update_repo mbot_natural_language_processing origin kinetic
printf "\n\n --- unmerged_packages_for_testing ---\n\n"
update_repo unmerged_packages_for_testing origin kinetic

# only for specific computers

# simulation repos only on harode server
if [ $(hostname) == "harode-server" ] ; then
    printf "\n\n --- mbot_simulation ---\n\n"
    update_repo mbot_simulation origin kinetic
    printf "\n\n --- mbot_simulation_environments ---\n\n"
    update_repo mbot_simulation_environments origin kinetic
fi

# only for the robot PC
if [ $(hostname) == "mbot05n" ] ; then
    # task planning
    printf "\n\n --- isr_planning ---\n\n"
    update_repo isr_planning origin kinetic

    # people following repos
    printf "\n\n --- bayes_people_tracker ---\n\n"
    update_repo bayes_people_tracker origin kinetic
    printf "\n\n --- bayestracking ---\n\n"
    update_repo bayestracking origin kinetic
    printf "\n\n --- HumanAwareness ---\n\n"
    update_repo HumanAwareness origin kinetic
    printf "\n\n --- spencer_people_tracking ---\n\n"
    update_repo spencer_people_tracking origin master
fi

# source personal configuration file (if it exists)
PERSONAL_CONFIG_FILE=$HOME/scripts/personal_config/update_workspace.sh
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE

printf "\n\n --- All done ! Ciao ---\n\n"

# go to where the user was at start
cd $current_user_dir
