# socrob alias: used to save time in typing commands
source ${HOME}/scripts/utils.sh

# ROS related
alias kill_all_ros_nodes='sudo pkill -f ros && sudo pkill -f java' # kill all ros nodes running on the robot
alias smach_viewer='rosrun smach_viewer smach_viewer.py'
alias rviz='rosrun rviz rviz --display-config ${RVIZ_CONFIG_PATH}'
alias reconfigure='rosrun rqt_reconfigure rqt_reconfigure' # open dynamic reconfigure
alias tf_view_frames='cd /var/tmp && rosrun tf2_tools view_frames.py && evince frames.pdf &' # view current frames
alias rqt_image_view='rosrun rqt_image_view rqt_image_view'
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
alias camk='catkin_make -j1 -l1' # build one pkg (you need to be somewhere inside your ros pkg)
alias cca="watch ccache -s"

# common handy alias
alias p='python'
alias sai='sudo apt-get install'

alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'
alias sl='ls' # when typing fast sometimes ls gets typed as sl

alias ..='cd .. && ls --color=auto' # going back one directory and showing files convenient alias
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias cap='pygmentize -g' # replacement of cat with python-pygments to cat with colors
alias m='wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz' # toggle terminal from restored to maximized
alias grep='grep --color=auto'
alias poweroff='sudo shutdown -h now' # shutdown pc
alias please='sudo $(history -p !!)' # run last command as sudo
alias wifi_on='sudo nmcli radio wifi on'
alias wifi_off='sudo nmcli radio wifi off'
alias S='source ${HOME}/.bashrc'
alias find_big_files='find . -size +10M -ls'
alias forget_git='git credential-cache exit'

# text editor
alias e='emacs -nw' # open emacs text editor in terminal mode
alias se='sudo emacs -nw' # open emacs text editor with admin rights
alias sublime='subl'
alias remove_endline_spaces="sed -i 's/\s*$//'" # remove automatically spaces at the end of files, needs the file as argument at the end, i.e. remove_spaces my_file.txt
alias clean='find . -name "*~" -type f -exec /bin/rm -fv -- {} +' # to clean temp files *.~ recursively

#Memory gpu cpu management
alias meminfo='free -m -l -t' ## pass options to free ##
alias psmem='ps auxf | sort -nr -k 4' ## get top process eating memory
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3' ## get top process eating cpu ##
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu' ## Get server cpu info ##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log' ## get GPU ram on desktop / laptop##
alias gpu='watch nvidia-smi' # display gpu usage

