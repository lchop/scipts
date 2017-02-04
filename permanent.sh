# the main script that should always be source from /home/user/.bashrc
#---------------------------------------------------------------------

# source personal configuration at beginning if exists
PERSONAL_CONFIG_FILE=$HOME/scripts/personal_config/personal_config.sh
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE

# set this env, only if it does not previouly exist, (override in personal_config.sh if required)
export ROS_WORKSPACE=${ROS_WORKSPACE:=$HOME/ros_ws/src}

# source a catkin workspace
source $HOME/scripts/source_ros_workspace.sh

# load environment variables
source $HOME/scripts/load_environment_variables.sh

# source mbot alias
source $HOME/scripts/alias.sh

# enable git completition
source $HOME/scripts/git-completion.bash

# display git branch on console prompt
source $HOME/scripts/display_git_branch_in_prompt.sh

# roscat cat a file by pkg_name and filename
source $HOME/scripts/roscat.sh

# source personal configuration at end (again) if exists
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE
