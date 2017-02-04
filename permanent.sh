# the main script that should always be source from /home/user/.bashrc
#---------------------------------------------------------------------

# source personal configuration at beginning if exists
PERSONAL_CONFIG_FILE=$HOME/scripts/personal_config/personal_config.sh
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE

# load environment variables
source $HOME/scripts/load_environment_variables.sh

# source a catkin workspace
source $HOME/scripts/source_ros_workspace.sh

# source mbot alias
source $HOME/scripts/alias.sh

# enable git completition
source $HOME/scripts/git-completion.bash

# display git branch on console prompt
source $HOME/scripts/display_git_branch_in_prompt.sh

# roscat cat a file by pkg_name and filename
source $HOME/scripts/roscat.sh

# source personal configuration at end (again)
PERSONAL_CONFIG_FILE=$HOME/scripts/personal_config/personal_config.sh
test -f $PERSONAL_CONFIG_FILE && source $PERSONAL_CONFIG_FILE
