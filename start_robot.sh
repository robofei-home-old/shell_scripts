#!/bin/bash

robot_ip=127.0.0.1
# robot_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
echo "robot_ip: " $robot_ip

# export robot
export ROS_MASTER_URI=http://${robot_ip[0]}:11311
# export extern
export ROS_IP=${robot_ip[0]}

# change rosconsole format
export ROSCONSOLE_FORMAT='[${severity}] [${time}]: ${node}: ${message}'

# source catkin
source devel/setup.zsh

######################################################################

# <!-- main info -->
enable_rviz=true
map_name=larc_2020
#map_name=servicesim
resources='$(find hera)/resources'

# <!-- robot info -->
robot_name=robot
#robot_model='$(find hera_description)/robots/hera.urdf.xacro'
robot_model='$(find hera_description)/urdf/hera_description.urdf'
teleop_keyboard=true

# <!-- robot config -->
init_pos_x=0.315679
init_pos_y=2.002578
init_pos_z=0.101323
init_yaw=-1.077902




# <!-- modules config -->
enable_hear=true
enable_talk=true
enable_map=true
enable_people=false
enable_navigation=true
enable_manipulator=false
enable_objects=false
enable_head=false

# start robot
roslaunch hera bring_up.launch enable_rviz:=$enable_rviz map_name:=$map_name resources:="$resources" robot_name:=$robot_name robot_model:="$robot_model" teleop_keyboard:=$teleop_keyboard init_pos_x:=$init_pos_x init_pos_y:=$init_pos_y init_pos_z:=$init_pos_z init_yaw:=$init_yaw enable_hear:=$enable_hear enable_talk:=$enable_talk enable_map:=$enable_map enable_people:=$enable_people enable_navigation:=$enable_navigation enable_manipulator:=$enable_manipulator enable_objects:=$enable_objects enable_head:=$enable_head
#roslaunch hera bring_up.launch robot_model:="$robot_model"
