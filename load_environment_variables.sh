# NETWORK CONFIGURATION
# export ROS_MASTER_URI=http://mbot05n:11311
export ROS_MASTER_URI=http://10.1.15.14:11311

# set ROS_IP env variable
if [ $(hostname) == "mbot05n" ]; then
   export ROS_IP=10.1.15.14
elif [ $(hostname) == "mbot05h" ]; then
   export ROS_IP=10.1.15.15
fi

# export ROS_NAMESPACE=mbot05 # for single robot is ok not to have namespace, however Luis requires so we then set later
export ROS_WORKSPACE=~/ros_ws

# VOCON NUANCE
export LD_LIBRARY_PATH=~/Software/nuance/bin/linux/i86:${LD_LIBRARY_PATH}
export NUANCE_LIBS=~/Software/nuance/bin/linux/i86

# ROBAI ARM
export EC_TOOLKITS=~/Software/Cyton1500/v3.3.3/toolkits
export EC_BIN=~/Software/Cyton1500/v3.3.3/bin
export EC_RENDER=render_OSS-20140131-gcc4.6-i386
export EC_SENSOR=sensor_OSS-20140131-gcc4.6-i386
export LD_LIBRARY_PATH=$EC_BIN:$LD_LIBRARY_PATH

# ROS RELATED
export EDITOR='vim' # rosed command will open editor using this program
export CATTER='pygmentize -g' # roscat function will display the contents of the file by using this program
export ROSCONSOLE_FORMAT='[${severity}] [${node}]: ${message}' # print ros messages on terminal by node name and message
#export ROS_NAMESPACE=mbot05
export ROSLAUNCH_SSH_UNKNOWN=1 # to allow running nodes without being a known host

# ROBOT RELATED
export ROBOT=mbot05
export ROBOT_ENV=ist-lab
