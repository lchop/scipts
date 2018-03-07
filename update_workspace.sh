#! /bin/bash

# store the current user location (current directory pwd) to send him back to this location when script finishes
current_user_dir=$(pwd)

# check if user only wants to check git pending jobs
if [ "$1" == "check-git-pending-jobs" ]; then
    echo 'user has requested only to check pendind git jobs'
    only_check_git_pendign_jobs=true
else
    printf "updating SocRob repositories...\n"
    only_check_git_pendign_jobs=false
fi

# check if user is harode server then ask for username and pass to save some time
if [ $HOSTNAME == "harode-server" -o $HOSTNAME == "mbot05n" ] ; then
    send_credentials_to_git=true
    if [[ -z "${SOCROB_USER}" ]]; then
        echo 'SOCROB_USER env not set, tip: export SOCROB_USER=your_git_user if you want to save some time ; )'
        # query username and password
        read -p "Enter username : " username
        read -s -p "Enter password : "  password
    else
        echo "hello ${SOCROB_USER} ! , welcome back"
        username=$SOCROB_USER
        read -s -p "Enter password : "  password
    fi
else
    send_credentials_to_git=false
fi

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
    # args : 1. repo name, 2. remote, 3.branch, 4. dante repo?

    # find out the current branch (filters out the * and other branches)
    current_branch="$(git branch | grep \* | cut -d ' ' -f2)"

    # if you are on x branch name and you want to pull from x then allow, otherwise do nothing
    if [ "${current_branch}" == "$3" ]; then
        # is safe to pull (requested branch is same with actual repo branch), so pulling

        # if pc is harode server or mbot send stored credential to git server to speed up
        if [ "$send_credentials_to_git" = true ] ; then

            if [ "$4" == "true" ]; then
                # repository is in dante

                # pull but send credentials to save time
                git pull http://${username}:${password}@dante.isr.tecnico.ulisboa.pt/socrob_at_home/$1.git $3
            else
                # repository is in github

                # pull but send credentials to save time
                git pull https://github.com/socrob/$1.git $3
            fi
        else
            # normal pull, do not send credentials
            git pull $2 $3
        fi

    else
        # warn the user about the fact that he tried to pull from x but he is currently in branch y, therefore doing nothing
        RED='\033[0;31m'
        NC='\033[0m' # No Color
        printf "${RED}ERROR: is not safe to pull, you requested to pull from \"$3\" but your repo is in branch \"$current_branch\", doing nothing...${NC}\n"
    fi
}

# function to change into the desired repo and then git pull
function update_repo()
{
    # args : 1. repo name, 2. remote, 3.branch, 4. dante repo?

    printf "\n\n --- "$1" ---\n\n"

    # check if user only wants to check git pending jobs
    if [ "$only_check_git_pendign_jobs" = true ] ; then
        # only check git pending jobs but do not pull
        cd $ROS_WORKSPACE/$1 && is_there_pending_git_jobs_test
    else
        # pull and check if there if there is pending jobs
        cd $ROS_WORKSPACE/$1 && safe_pull $1 $2 $3 $4 && is_there_pending_git_jobs_test
    fi
}

# scripts repo
printf "\n\n --- scripts ---\n\n"
# check if user only wants to check git pending jobs
if [ "$only_check_git_pendign_jobs" = true ] ; then
    # only check git pending jobs but do not pull
    cd $HOME/scripts && is_there_pending_git_jobs_test
else
    # pull and check if there if there is pending jobs
    cd $HOME/scripts && safe_pull scripts origin master true && is_there_pending_git_jobs_test
fi

# main repositories
update_repo isr_monarch_robot origin kinetic true
update_repo mbot_drivers origin kinetic true
update_repo cyton_gamma_1500_description origin tec-gripper false
update_repo mbot_description origin kinetic true
update_repo robocup-at-work origin kinetic false
update_repo unmerged_packages_for_testing origin kinetic true

# only for specific computers

# simulation repos only on harode server
if [ $HOSTNAME == "harode-server" ] ; then
    update_repo mbot_simulation origin kinetic true
    update_repo mbot_simulation_environments origin kinetic false
    update_repo mbot_natural_language_processing origin kinetic true
fi

# only for the robot PC
if [ $HOSTNAME == "mbot05n" ] ; then
    # task planning
    update_repo isr_planning origin kinetic true

    # people following repos
    update_repo bayes_people_tracker origin kinetic false
    update_repo bayestracking origin kinetic false
    update_repo HumanAwareness origin kinetic false
    update_repo spencer_people_tracking origin master false
    update_repo mbot_natural_language_processing origin kinetic true
fi

# source personal configuration file (if it exists), this is to pull from other repos you might have in your workspace!
PERSONAL_CONFIG_FILE=$HOME/scripts/personal_config/update_workspace.sh
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE

printf "\n\n --- All done ! Ciao\n\n"
printf "${YELLOW}WARNING: Remember to check each repo terminal output (above) to see if there were any errors !\n"

# go to where the user was at start
cd $current_user_dir
