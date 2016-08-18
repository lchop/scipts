#NETWORK CONFIGURATION
#export ROS_MASTER_URI=http://mbot05n:11311
export ROS_MASTER_URI=http://10.1.15.14:11311
export ROS_IP=10.1.15.14
#export MBOT_NAME=mbot05
#export ROS_NAMESPACE=mbot05 # for single robot is ok not to have namespace, however Luis requires so we then set later
export ROS_WORKSPACE=~/Git/code/catkin_ws

#VOCON NUANCE
export LD_LIBRARY_PATH=~/Software/nuance/bin/linux/i86:${LD_LIBRARY_PATH}
export NUANCE_LIBS=~/Software/nuance/bin/linux/i86

#ROBAI ARM
export EC_TOOLKITS=~/Software/Cyton1500/v3.3.3/toolkits
export EC_BIN=~/Software/Cyton1500/v3.3.3/bin
export EC_RENDER=render_OSS-20140131-gcc4.6-i386
export EC_SENSOR=sensor_OSS-20140131-gcc4.6-i386
export LD_LIBRARY_PATH=$EC_BIN:$LD_LIBRARY_PATH

#ROS RELATED
export EDITOR='vim' # rosed command will open editor using this program
export CATTER='pygmentize -g' # roscat function will display the contents of the file by using this program
export ROSCONSOLE_FORMAT='[${severity}] [${node}]: ${message}' # print ros messages on terminal by node name and message

#ROBOT RELATED
export ROBOT=mbot05
export ROBOT_ENV=ist-lab

#LUIS STUFF
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/socrob/Git/code/rosbuild_ws
export ROS_NAMESPACE=mbot05
