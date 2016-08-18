#source /opt/ros/hydro/setup.bash
#source /opt/monarch_msgs/setup.bash
#source /opt/mbot_ros/setup.bash

source /home/socrob/Git/code/catkin_ws/devel/setup.bash
#source /home/socrob/ros/socrob_at_home/code/trunk/catkin_ws
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/socrob/Git/code/rosbuild_ws
#export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/socrob/ros/socrob_at_home/code/trunk/rosbuild_ws

#export ROS_MASTER_URI=http://mbot05n:11311
export ROS_MASTER_URI=http://10.1.15.14:11311
export ROS_IP=10.1.15.14
export MBOT_NAME=mbot05
export ROS_NAMESPACE=mbot05

#VOCON NUANCE
export LD_LIBRARY_PATH=~/Software/nuance/bin/linux/i86:${LD_LIBRARY_PATH}
export NUANCE_LIBS=~/Software/nuance/bin/linux/i86

#ROBAI ARM
export EC_TOOLKITS=~/Software/Cyton1500/v3.3.3/toolkits
export EC_BIN=~/Software/Cyton1500/v3.3.3/bin
export EC_RENDER=render_OSS-20140131-gcc4.6-i386
export EC_SENSOR=sensor_OSS-20140131-gcc4.6-i386
export LD_LIBRARY_PATH=$EC_BIN:$LD_LIBRARY_PATH


# Enable tab completion
source ~/git_config/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"
cyan="\[\033[0;36m\]"
yellow="\[\033[1;33m\]"

# Change command prompt
source ~/git_config/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$yellow\u$green\$(__git_ps1)$cyan \w $ $reset"

export TZ="/usr/share/zoneinfo/Europe/Berlin"
