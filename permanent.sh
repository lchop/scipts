# the main script that should always be source from /home/user/.bashrc
#---------------------------------------------------------------------

# source personal configuration file (if it exists)
PERSONAL_CONFIG_FILE=$HOME/scripts/personal_config/personal_config.sh

# set this env, only if it does not previously exist, (override in personal_config.sh if required)
export ROS_WORKSPACE=${ROS_WORKSPACE:=$HOME/ros_ws/src}
#export ROS_WORKSPACE=${ROS_WORKSPACE:=$HOME/crd_ws/src}

#export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH:=$HOME/ros_ws/src/simulation_tests/resources/model}


# source a catkin workspace
source $HOME/scripts/source_ros_workspace.sh

# source personal configuration file (if it exists), this is needed because
# sourcing the catkin workspace (previous step) destroys some env variables
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE

# source mbot alias
source $HOME/scripts/alias.sh

# enable git completition
source $HOME/scripts/git-completion.bash

# display git branch on console prompt
source $HOME/scripts/display_git_branch_in_prompt.sh

# roscat cat a file by pkg_name and filename
source $HOME/scripts/roscat.sh

# source autocomplete extensions
source $HOME/scripts/autocomplete.sh

# source personal config file one last time
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE
