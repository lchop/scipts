# socrob alias: used to save time in typing commands

# ROS related
alias kill_all_ros_nodes='sudo pkill -f ros' # kill all ros nodes running on the robot
alias smach_viewer='rosrun smach_viewer smach_viewer.py'
alias rviz='rosrun rviz rviz --display-config ${ROS_WORKSPACE}/isr_monarch_robot/mbot_tools/rviz_configurations/universal.rviz'
alias reconfigure='rosrun rqt_reconfigure rqt_reconfigure' # open dynamic reconfigure
alias tf_view_frames='cd /var/tmp && rosrun tf2_tools view_frames.py && evince frames.pdf &' # view current frames
alias socrob_create_pkg='source ~/scripts/create_ros_pkg.sh'
alias clean_pkg_from_ws='source ~/scripts/clean_pkg_from_ws.sh'

# compilation
alias cb='catkin build' # build the entire catkinworkspace (you need to be somewhere inside your catkin workspace)
alias cbt='catkin build --this' # build one pkg (you need to be somewhere inside your ros pkg)

# common handy tools
alias sl='ls' # when typing fast sometimes ls gets typed as sl
alias cap='pygmentize -g' # replace cat with python-pygments to cat with colors
alias ..='cd .. && ls' # going back one directory and showing files convenient alias
alias m='wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz' # toggle terminal from restored to maximized
alias pull='git pull origin kinetic' # update socrob repository, works only for those which default branch is kinetic and if your remote name is origin
alias poweroff='sudo shutdown -h now' # shutdown pc

# text editor
alias e='emacs -nw' # open emacs text editor in terminal mode
alias se='sudo emacs -nw' # open emacs text editor with admin rights
alias sublime='sublime-text'
alias remove_endline_spaces="sed -i 's/\s*$//'" # remove automatically spaces at the end of files, needs the file as argument at the end, i.e. remove_spaces my_file.txt
alias clean='find . -name "*~" -type f -exec /bin/rm -fv -- {} +' # to clean temp files *.~ recursively

# Robot network connection
alias mbot='ssh socrob@10.1.15.14' # ssh to mbot05 pc1 (also known as nav pc)
alias mbot2='ssh socrob@10.1.15.15' # ssh to mbot05 pc2 (also known as hri pc)
alias hello_pub='rostopic pub /test std_msgs/String hello' # publish a test topic to test network sanity
alias hello_sub='rostopic echo /test' # echo a test topic to test network sanity
alias export_mbot='export ROS_MASTER_URI=http://10.1.15.14:11311'
alias export_harode='export ROS_MASTER_URI=http://10.0.2.69:11311'
alias harode='ssh harode@10.0.2.69' # ssh to harode server
alias harodeipv6='ssh -6 -X harode@harode01.ipv6.isr.ist.utl.pt' # ssh to harode server from outside ist

# Competition (ERL)
alias refbox_server='roslaunch roah_rsbb roah_rsbb.launch' # to communicate with referee box
alias refbox_client='roslaunch roah_rsbb_comm_ros test.launch team_name:=SocRob robot_name:=mbot05 rsbb_key:=EKY3GZUe rsbb_host:=10.0.255.255' # to communicate with referee box

# robot components
# ------

# mbot driver
alias bringup_mbot="bash ${HOME}/scripts/safe_bringup.sh" # launch (real) robot driver
alias bringup_sim='roslaunch mbot_simulation robot.launch' # launch mbot simulation
alias bat='rosservice call /mbot_driver/sensors/batteries | grep battery' # check battery level on the robot
alias teleop='roslaunch mbot_teleop_joypad teleop_joypad.launch' # teleoperation with joypad
alias rotate_touchscreen='bash ${ROS_WORKSPACE}/isr_monarch_robot/mbot_drivers/idmind_drivers/idmind_config/ros/scripts/rotate_screen.sh'
alias open_network_manager='sudo nm-connection-editor' # needs the ssh connection to be made via ssh -X, opens gui for network manager
alias rqt_mbot_actions='roslaunch mbot_actions rqt_action_client.launch' # gui to interact with action servers

# navigation
alias dwa='roslaunch mbot_2dnav 2dnav.launch' # launch navigation stack in dwa mode
alias cancel_move_base_goal='rostopic pub /move_base/cancel actionlib_msgs/GoalID -- {}'

# object recognition alias
alias perceive_objects='rosrun mbot_actions perceive_location_client_test_node'
alias enable_object_training='source ~/scripts/enable_object_trainning.sh'

# manipulation
alias moveit='roslaunch mbot_moveit_ist_left_arm move_group.launch' # launch moveit interface
alias start_pregrasp_planner='rostopic pub --once /mir_manipulation/pregrasp_planner_pipeline/event_in std_msgs/String e_start'
alias stop_pregrasp_planner='rostopic pub --once /mir_manipulation/pregrasp_planner_pipeline/event_in std_msgs/String e_stop'
alias move_arm_planned='rostopic pub --once /move_arm_planned_motion/event_in std_msgs/String e_start'
alias open_gripper='rostopic pub --once /left_arm_gripper/gripper_command mcr_manipulation_msgs/GripperCommand "command: 0"'
alias close_gripper='rostopic pub --once /left_arm_gripper/gripper_command mcr_manipulation_msgs/GripperCommand "command: 1"'
alias pick='rosrun mbot_actions pick_object_client_test_node' # pick an object with the robot arm
alias kill_arm='rosrun cyton_gamma_1500_driver set_arm_torque_off' # kill all arm joints alias
alias rqt_moveit='rqt --standalone mcr_moveit_commander_gui --force-discover' # moveit commander custom gui interface

# task planning
alias skynet='rosrun mbot_demos planning_coordinator_sm_node' # run planning state machine
alias rqt_rosplan='rqt --standalone rosplan_rqt.dispatcher.ROSPlanDispatcher' # knowledge base visualization
alias rqt_planning_coordinator='roslaunch mir_planning_core planning_coordinator_event_gui.launch' # task planning sm manual interface
