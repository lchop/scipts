# socrob alias: used to save time in typing commands
source ${HOME}/scripts/utils.sh

export MBOT_IP=10.1.15.14
export MBOT_IP_7=10.1.15.20
export HARODE_IP=10.0.2.69
export ROAH_MBOT_IP=10.0.0.41

# ROS related
alias kill_all_ros_nodes='sudo pkill -f ros' # kill all ros nodes running on the robot
alias smach_viewer='rosrun smach_viewer smach_viewer.py'
alias rviz='rosrun rviz rviz --display-config ${ROS_WORKSPACE}/isr_monarch_robot/mbot_tools/rviz_configurations/universal.rviz'
alias reconfigure='rosrun rqt_reconfigure rqt_reconfigure' # open dynamic reconfigure
alias tf_view_frames='cd /var/tmp && rosrun tf2_tools view_frames.py && evince frames.pdf &' # view current frames
alias socrob_create_pkg='source ~/scripts/create_ros_pkg.sh'
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

# common handy alias
alias p='python'
alias sai='sudo apt install'
alias sl='ls' # when typing fast sometimes ls gets typed as sl
alias cap='pygmentize -g' # replacement of cat with python-pygments to cat with colors
alias ..='cd .. && ls' # going back one directory and showing files convenient alias
alias m='wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz' # toggle terminal from restored to maximized
alias pull='git pull origin kinetic' # update socrob repository, works only for those which default branch is kinetic and if your remote name is origin
alias poweroff='sudo shutdown -h now' # shutdown pc
alias update_workspace='source ~/scripts/update_workspace.sh' # to pull from SocRob repos and get the latest code
alias check_git_pending_jobs='source ~/scripts/update_workspace.sh check-git-pending-jobs' # check if you have uncommitted stuff in your SocRob repos
alias please='sudo $(history -p !!)' # run last command as sudo
alias wifi_on='sudo nmcli radio wifi on'
alias wifi_off='sudo nmcli radio wifi off'
alias S='source ${HOME}/.bashrc'
alias find_big_files='find . -size +10M -ls'
alias gpu='watch nvidia-smi' # display gpu usage
alias record_video='bash ~/scripts/record_video_robot_camera/record_video_robot_camera.sh' # record video with mbot camera

# text editor
alias e='emacs -nw' # open emacs text editor in terminal mode
alias se='sudo emacs -nw' # open emacs text editor with admin rights
alias sublime='sublime-text'
alias remove_endline_spaces="sed -i 's/\s*$//'" # remove automatically spaces at the end of files, needs the file as argument at the end, i.e. remove_spaces my_file.txt
alias clean='find . -name "*~" -type f -exec /bin/rm -fv -- {} +' # to clean temp files *.~ recursively

# Robot network connection
alias mbot='ssh socrob@$MBOT_IP' # ssh to mbot05 pc1 (also known as nav pc)
alias mbot7='ssh socrob@$MBOT_IP_7' # ssh to mbot07 pc1 (also known as nav pc)
alias roah_mbot='ssh socrob@$ROAH_MBOT_IP' #ssh to mbot05 pc1 in roah network
alias mbot2='ssh socrob@10.1.15.15' # ssh to mbot05 pc2 (also known as hri pc)
alias hello_pub='rostopic pub /test std_msgs/String hello' # publish a test topic to test network sanity
alias hello_sub='rostopic echo /test' # echo a test topic to test network sanity
alias export_mbot='export ROS_MASTER_URI=http://$MBOT_IP:11311 && export ROS_IP=`get_interface_that_pings $MBOT_IP | get_ip_of_interface`'
alias export_mbot7='export ROS_MASTER_URI=http://$MBOT_IP_7:11311 && export ROS_IP=`get_interface_that_pings $MBOT_IP_7 | get_ip_of_interface`'
alias export_roah_mbot='export ROS_MASTER_URI=http://$ROAH_MBOT_IP:11311 && export ROS_IP=`get_interface_that_pings $ROAH_MBOT_IP | get_ip_of_interface`'
alias export_harode='export ROS_MASTER_URI=http://$HARODE_IP:11311 && export GAZEBO_MASTER_URI=http://$HARODE_IP:11345 && export ROS_IP=`get_interface_that_pings $HARODE_IP | get_ip_of_interface`'
alias harode='ssh harode@$HARODE_IP' # ssh to harode server
alias harodeipv6='ssh -6 -X harode@harode01.ipv6.isr.ist.utl.pt' # ssh to harode server from outside ist

# Competition (ERL)
alias refbox_server='roslaunch roah_rsbb roah_rsbb.launch' # to communicate with referee box
# to communicate with referee box
alias refbox_client='roslaunch roah_rsbb_comm_ros test.launch team_name:=SocRob robot_name:=mbot05 rsbb_key:=EKY3GZUe rsbb_host:=10.0.255.255'
alias refbox_sync='sudo ntpdate -u 10.0.0.1' # perform time synchronization with refbox server

# robot components
# ------

# general purpose service robot (GPSR)
alias gpsr='roslaunch gpsr gpsr.launch'
alias gpsr_data_collection='roslaunch gpsr gpsr.launch data_collection:=true'

# mbot driver
alias bringup_mbot='bash ${HOME}/scripts/safe_bringup.sh' # launch (real) robot driver
alias bat='rosservice call /mbot_driver/sensors/batteries | grep battery' # check battery level on the robot
alias teleop='roslaunch mbot_teleop_joypad teleop_joypad.launch' # teleoperation with joypad
alias rotate_touchscreen='rosrun idmind_config rotate_screen.sh'
alias open_network_manager='sudo nm-connection-editor' # needs the ssh connection to be made via ssh -X, opens gui for network manager
alias rqt_mbot_actions='roslaunch mbot_actions rqt_action_client.launch' # gui to interact with action servers
alias mbot_class='rosrun mbot_robot_class interactive_node.sh' # ipython interaction with mbot via mbot_robot_class (example after this command: mbot.say('hello')
alias head_camera_on_screen="export DISPLAY=:0 && bash -c 'rosrun rqt_image_view rqt_image_view /head_camera/rgb/image_raw'"
alias undock='rosservice call /mbot_driver/sensors/dock_undock "control: 1"'

# simulation
alias bringup_sim='roslaunch mbot_simulation robot.launch' # launch mbot simulation with isr tested
# launch simulator with empty world to save resources
alias bringup_sim_empty='roslaunch mbot_simulation robot.launch world_name:=empty.world'
# launch simulator with grasp world, a world with front small table and objects in front of the robot
alias bringup_sim_grasping='roslaunch mbot_simulation robot.launch world_name:=mbot_grasping.world'
# launch simulator with storing groceries world, a world without sofa and with a small table near the cupboard
alias bringup_sim_storing='roslaunch storing_groceries gazebo_storing_bringup.launch'
# switch between arm controllers during runtime, requires args: origin target, i.e. trajectory position. (admissible values: trajectory, position, velocity)
alias switch_arm_sim_ctrl='rosrun mbot_gazebo_control switch_arm_sim_ctrl'

# navigation
alias dwa='roslaunch mbot_2dnav 2dnav.launch' # launch navigation stack in dwa mode
alias cancel_move_base_goal='rostopic pub /move_base/cancel actionlib_msgs/GoalID -- {}'

# object recognition alias
alias enable_object_training='source ~/scripts/enable_object_trainning.sh'
alias tilt_head_cam='rostopic pub --once /cmd_head_camera_motor std_msgs/UInt16' # tilt the camera to a specific anglei (requires an angle as argument)
alias lookup='rostopic pub --once /cmd_head_camera_motor std_msgs/UInt16 75' # tilt the camera up to be able to see a person
alias perceive='rostopic pub --once /mcr_perception/object_detector/event_in e_trigger' # trigger perception pipeline and recognize objects

# manipulation
alias moveit='roslaunch mbot_moveit_tec_arm move_group.launch' # launch moveit interface
alias start_pregrasp_planner='rostopic pub --once /mir_manipulation/pregrasp_planner_pipeline/event_in std_msgs/String e_start'
alias stop_pregrasp_planner='rostopic pub --once /mir_manipulation/pregrasp_planner_pipeline/event_in std_msgs/String e_stop'
alias move_arm_planned='rostopic pub --once /move_arm_planned_motion/event_in std_msgs/String e_start'
alias open_gripper='rostopic pub --once /left_arm_gripper/gripper_command mcr_manipulation_msgs/GripperCommand "command: 0"'
alias close_gripper='rostopic pub --once /left_arm_gripper/gripper_command mcr_manipulation_msgs/GripperCommand "command: 1"'
alias pick='rosrun mbot_actions pick_object_client_test_node' # pick an object with the robot arm
alias kill_arm='rosservice call /cyton_gamma_1500_driver/arm_interaction_node/left_arm/torque_enable "torque_enable: false"' # set all arm joints torque off
alias set_arm_torque_on='rosservice call /cyton_gamma_1500_driver/arm_interaction_node/left_arm/torque_enable "torque_enable: true"' # set all arm joints torque on
alias rqt_moveit='rqt --standalone mcr_moveit_commander_gui --force-discover' # moveit commander custom gui interface

# task planning
alias skynet='rosrun mbot_demos planning_coordinator_sm_node' # run planning state machine
alias rqt_rosplan='rqt --standalone rosplan_rqt.dispatcher.ROSPlanDispatcher' # knowledge base visualization
alias rqt_planning_coordinator='roslaunch mir_planning_core planning_coordinator_event_gui.launch' # task planning sm manual interface

# human robot interaction
alias set_emotion='rostopic pub --once /led_emotions_interface/emotions std_msgs/String' # requires the emotion as argument, Happiness, Anger, Fear, etc.
alias happy='rostopic pub --once /led_emotions_interface/emotions std_msgs/String Happiness' # Set the robot face to be happy
alias angry='rostopic pub --once /led_emotions_interface/emotions std_msgs/String Anger' # Set the robot face to be angry
alias surprised='rostopic pub --once /led_emotions_interface/emotions std_msgs/String Surprise' # Set the robot face to be surprised
alias sad='rostopic pub --once /led_emotions_interface/emotions std_msgs/String Sadness' # Set the robot face to be sad
alias speak="espeak -s 120 -v en-us '" # this alias requires a ' at the end of the msg
alias mbot_mirror_display='~/scripts/live_robot_screen.sh' # this alias mirrors the robot's display to your own computer
