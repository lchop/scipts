# monarch robot driver related alias
alias kill_driver='sudo pkill -f ros'
#alias bringup_mbot='source /opt/mbot_ros/setup.bash && roslaunch /opt/mbot_ros/share/mbot_ros/mbot.launch'
alias bringup_mbot='roslaunch mbot_bringup robot.launch'

# competition alias
alias scan='rostopic hz /mbot05/scan'
alias bat='rostopic echo /mbot05/batteries_voltage'
alias flags='emacs -nw /home/socrob/ros/socrob_at_home/code/trunk/rosbuild_ws/rockin_tasks/launch/rockin_tasks.launch'
alias rockin='roslaunch rockin_tasks rockin_tasks.launch'
alias socrob='roslaunch socrob_launch main_nav.launch'

# tools alias
alias clean='find . -name "*~" -type f -exec /bin/rm -fv -- {} +' # to clean temp files *.~ recursively
alias sl='ls' # when typing fast sometimes ls gets typed as sl
alias cap='pygmentize -g' # cat files in color by using pygmentize program

# network testing alias
alias hello_pub='rostopic pub /test std_msgs/String hello'
alias hello_sub='rostopic echo /test'

# convenient alias
alias ..='cd .. && ls'

#component alias
alias dwa='roslaunch mbot_2dnav 2dnav.launch'

#to build all catkin_ws and keep it that way
alias build_all_catkin_ws='catkin_make -DCATKIN_WHITELIST_PACKAGES=""'