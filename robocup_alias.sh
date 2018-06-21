# alias used during RoboCup 2018 

# storing groceries
alias storing_groceries='roslaunch storing_groceries storing_groceries.launch'

# gpsr
alias gpsr='roslaunch gpsr gpsr.launch'
alias gpsr2='roslaunch darknet_ros_py darknet_ros_py_known_objects.launch'
alias gpsr_data_collection='roslaunch gpsr gpsr.launch data_collection:=true'
alias eegpsr='roslaunch eegpsr eegpsr.launch'
alias eegpsr2='roslaunch darknet_ros_py darknet_ros_py_known_objects.launch'

# bronze cup
alias opt_ctrler_start='rostopic pub /emilia_ctrl/event_in std_msgs/String "data: 'e_start'" --once &'
alias opt_ctrler_stop='rostopic pub /emilia_ctrl/event_in std_msgs/String "data: 'e_start'" --once &'
