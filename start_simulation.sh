#!/bin/bash

robot_ip=127.0.0.1
#robot_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
echo "robot_ip: " $robot_ip

# export robot
export ROS_MASTER_URI=http://${robot_ip[0]}:11311
# export extern
export ROS_IP=${robot_ip[0]}

# change rosconsole format 
export ROSCONSOLE_FORMAT='[${severity}] [${time}]: ${node}: ${message}'

# source catkin
source devel/setup.bash

######################################################################

# map_name=where_is_this
# map_name=wrs2020_fast_highrtf_knob
map_name=wrs2020
enable_gui=true

# start robot
# roslaunch worlds load.launch model:=$map_name enable_gui:=$enable_gui
#roslaunch sd_worlds gazebo.launch model:=$map_name enable_gui:=$enable_gui
#roslaunch social_worlds start_world.launch model:=$map_name enable_gui:=$enable_gui 
roslaunch social_worlds start_world.launch world_name:=$map_name enable_gui:=$enable_gui
rosrun tmc_gazebo_task_evaluators setup_score_widget
# roslaunch servicesim_competition competition.launch
