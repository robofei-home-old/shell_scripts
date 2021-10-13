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

# start task
#roslaunch tasks bring_up.launch enable_bot:=true task:=Demo
#roslaunch tasks bring_up.launch enable_bot:=true task:=Inspection
#roslaunch tasks bring_up.launch enable_bot:=true task:=CarryMyLuggage
#roslaunch tasks bring_up.launch enable_bot:=true task:=CleanUp
#roslaunch tasks bring_up.launch enable_bot:=true task:=GPSR
#roslaunch tasks bring_up.launch enable_bot:=true task:=ServingDrinks
#roslaunch tasks bring_up.launch enable_bot:=true task:=StoringGroceries
#roslaunch tasks bring_up.launch enable_bot:=true task:=TakeOutTheGarbage
#roslaunch tasks bring_up.launch enable_bot:=true task:=CountingObjects
#roslaunch tasks bring_up.launch enable_bot:=true task:=Manipulation
#roslaunch tasks bring_up.launch enable_bot:=true task:=FollowMe
#roslaunch tasks bring_up.launch enable_bot:=true task:=spr
#roslaunch tasks bring_up.launch enable_bot:=false task:=ReceptionistCopy
# roslaunch tasks bring_up.launch enable_bot:=false task:=ReceptionistCopy1
#roslaunch tasks bring_up.launch enable_bot:=false task:=restaurant
roslaunch tasks bring_up.launch enable_bot:=true task:=CleanUp_simulation
#roslaunch tasks bring_up.launch enable_bot:=true task:=whereisthis
