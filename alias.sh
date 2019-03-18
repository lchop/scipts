# socrob alias: used to save time in typing commands
source ${HOME}/scripts/utils.sh

#export MBOT_IP=10.1.15.14


# ROS related
alias kill_all_ros_nodes='sudo pkill -f ros && sudo pkill -f java' # kill all ros nodes running on the robot
alias smach_viewer='rosrun smach_viewer smach_viewer.py'
alias rviz='rosrun rviz rviz --display-config ${RVIZ_CONFIG_PATH}'
alias reconfigure='rosrun rqt_reconfigure rqt_reconfigure' # open dynamic reconfigure
alias tf_view_frames='cd /var/tmp && rosrun tf2_tools view_frames.py && evince frames.pdf &' # view current frames
alias clean_pkg_from_ws='source ~/scripts/clean_pkg_from_ws.sh'

# ROS bash alias
alias r='rviz'
alias rc='roscore'
alias rt='rostopic'
alias rs='rosservice'
alias rn='rosnode'
alias rl='roslaunch'
alias rr='rosrun'
alias rb='rosbag'
alias rcd='roscd'
# to source the ROS workspace in which you are currently located (pwd)
alias sd='ll devel/setup.bash && echo "source devel/setup.bash" && source devel/setup.bash'

# compilation
alias cb='catkin build' # build the entire catkinworkspace (you need to be somewhere inside your catkin workspace)
alias cbt='catkin build --this' # build one pkg (you need to be somewhere inside your ros pkg)

# testing
alias cbtest='catkin run_tests --no-deps --this' # perform catkin tests specified in the CMakeLists of this package

# common handy alias
alias p='python'
alias sai='sudo apt install'
alias sl='ls' # when typing fast sometimes ls gets typed as sl
alias cap='pygmentize -g' # replacement of cat with python-pygments to cat with colors
alias ..='cd .. && ls' # going back one directory and showing files convenient alias
alias m='wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz' # toggle terminal from restored to maximized
alias pull='git pull origin kinetic' # update socrob repository, works only for those which default branch is kinetic and if your remote name is origin
alias poweroff='sudo shutdown -h now' # shutdown pc
alias please='sudo $(history -p !!)' # run last command as sudo
alias wifi_on='sudo nmcli radio wifi on'
alias wifi_off='sudo nmcli radio wifi off'
alias S='source ${HOME}/.bashrc'
alias find_big_files='find . -size +10M -ls'
alias gpu='watch nvidia-smi' # display gpu usage
alias forget_git='git credential-cache exit'

# text editor
alias e='emacs -nw' # open emacs text editor in terminal mode
alias se='sudo emacs -nw' # open emacs text editor with admin rights
alias sublime='subl'
alias remove_endline_spaces="sed -i 's/\s*$//'" # remove automatically spaces at the end of files, needs the file as argument at the end, i.e. remove_spaces my_file.txt
alias clean='find . -name "*~" -type f -exec /bin/rm -fv -- {} +' # to clean temp files *.~ recursively

# source robocup competition alias
#source $HOME/scripts/robocup_alias.sh
