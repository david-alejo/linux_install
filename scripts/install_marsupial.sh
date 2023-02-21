#! /bin/bash
export ROS_DISTRO=noetic
sudo apt-get install ros-$ROS_DISTRO-octomap-msgs ros-$ROS_DISTRO-octomap-ros -y
sudo apt-get install ros-$ROS_DISTRO-costmap-2d ros-$ROS_DISTRO-octomap-server ros-$ROS_DISTRO-octomap-mapping -y
sudo apt-get install libpcl-dev libpcl-kdtree1.10

# Create workspace
source /opt/ros/$ROS_DISTRO/setup.bash
cd ~
mkdir -p ~/marsupial_ws/src
cd ~/marsupial_ws/
catkin_make
cd ~/marsupial_ws/src

source ~/marsupial_ws/devel/setup.bash

# For localization stuff
git clone -noetic https://github.com/robotics-upo/dll.git
git clone https://github.com/robotics-upo/odom_to_tf.git

## Dependencies for Behavior Tree
echo "\n Installing BT Dependencies \n\n"
sudo apt-get install ros-$ROS_DISTRO-ros-type-introspection -y
sudo apt-get install qtbase5-dev libqt5svg5-dev -y
sudo apt install libdw-dev -y
echo "\n Installing BT Packages \n\n"
# git clone https://github.com/robotics-upo/behavior-tree-upo-actions.git
git clone https://github.com/robotics-upo/BehaviorTree.CPP.git
git clone https://github.com/robotics-upo/Groot.git

# To install planner lazy-theta*
echo "\n Installing Lazy Theta* Planner \n\n"
git clone -b marsupial https://github.com/robotics-upo/lazy_theta_star_planners.git

# To install NIX_common package
echo "\n Installing NIX common package \n\n"
git clone https://github.com/robotics-upo/nix_common.git

# To install Random planners
echo "\n Installing Random Planner \n\n"
git clone -b develop https://github.com/SaimonMR/rrt_star_planners.git

# To install Marsupial Optimizer
echo "\n Installing Marsupial Optimizer \n\n"
git clone -b noetic https://github.com/robotics-upo/marsupial_optimizer.git

# To get action for actionlib
echo "\n Installing UPO Actions \n\n"
git clone https://github.com/robotics-upo/upo_actions.git

#To get a marker in the desired frame_link
echo "\n Installing UPO Markers \n\n"
git clone https://github.com/robotics-upo/upo_markers.git

# Get timed roslaunch
git clone -b melodic-devel https://github.com/robotics-upo/timed_roslaunch.git

# Compile the workspace
cd ~
catkin_make
