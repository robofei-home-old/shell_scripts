#!/bin/bash
echo "Creating catkin folder"
cd ~
mkdir catkin_hera
cd catkin_hera
mkdir src
source /opt/ros/melodic/setup.bash
catkin_make
cd src

echo "Getting full directory"
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done

RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

echo "Cloning Repositories"
git clone https://github.com/robofei-home/hera_robot
git clone https://github.com/robofei-home/simulation_system
git clone https://github.com/robofei-home/shell_scripts
git clone https://github.com/robofei-home/hera
git clone https://github.com/robofei-home/tmc_wrs_gazebo
git clone https://github.com/robofei-home/tmc_gazebo_task_evaluators

cd $DIR
echo "Cloning Repositories"
git clone https://github.com/robofei-home/hera_tasks
git clone https://github.com/robofei-home/manipulation_system
git clone https://github.com/robofei-home/vision_system
cd vision_system
git clone https://github.com/robofei-home/dodo_detector_ros
cd ..
git clone https://github.com/robofei-home/navigation_system
cd navigation_system
git clone https://github.com/robofei-home/hera_nav
cd ..
git clone https://github.com/robofei-home/speech_recognition
echo "Setting up speech recognition package"
sudo chmod +x speech_recognition/gsr_ros/src/recognition.py
sudo chmod +x speech_recognition/gtts_ros/src/gtts_node.py
cd speech_recognition/gtts_ros/src
git clone http://github.com/festvox/flite
cd flite
./configure
make
make get_voices

echo "Installing Dependencies"
sudo apt-get install ros-melodic-object-recognition-msgs -y
sudo apt-get install ros-melodic-people-msgs -y
sudo apt-get install libsndfile1-dev python-dev libportaudio2 libportaudiocpp0 portaudio19-dev vorbis-tools swig -y
sudo apt-get install python-pip -y
sudo apt-get install espeak -y
sudo apt-get install mpg321 -y
sudo apt-get install ros-melodic-base-local-planner -y
sudo apt-get install ros-melodic-teleop-twist-keyboard -y
sudo apt-get install ros-melodic-ros-control ros-melodic-ros-controllers -y
sudo apt-get install ros-melodic-amcl -y
sudo apt-get install ros-melodic-move-base -y 
sudo apt-get install ros-melodic-trac-ik-kinematics-plugin -y
sudo apt-get install ros-melodic-map-server -y
sudo apt-get install xterm -y
sudo apt-get install ros-melodic-moveit-*

echo "Installing python dependencies"
pip install SpeechRecognition
sudo pip install face-recognition
python -m pip install --upgrade pip setuptools wheel
pip install --upgrade pocketsphinx
python -m pip install jellyfish
python -m pip install deepspeech==0.4.1
sudo pip2 install -U gTTS
sudo pip2 install --upgrade cryptography
sudo python -m easy_install --upgrade pyOpenSSL

cd ~/Downloads && wget https://files.pythonhosted.org/packages/ab/42/b4f04721c5c5bfc196ce156b3c768998ef8c0ae3654ed29ea5020c749a6b/PyAudio-0.2.11.tar.gz
cd ~/Downloads &&  tar xvzf PyAudio-0.2.11.tar.gz
cd ~/Downloads/PyAudio-0.2.11 && sudo python setup.py install
cd $DIR
cd ..
catkin_make
