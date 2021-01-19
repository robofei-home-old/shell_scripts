#!/bin/bash

robot_ip=192.168.15.1
# robot_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
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

# permissions
sudo chmod 777 /dev/ttyACM*
sudo chmod 777 /dev/ttyUSB*
sudo chmod 777 /dev/opencm

# find laser and arduino ports
sudo python path_finder.py 15d1 0000 # laser
sudo python path_finder.py 2341 003d # Arduino base
sudo python path_finder.py 2341 0043 # Arduino head
sudo python path_finder.py fff1 ff48 # Dynamixel

# start robot
roslaunch hera_robot devices.launch
