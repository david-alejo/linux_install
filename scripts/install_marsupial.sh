#! /bin/bash
export ROS_DISTRO=noetic
sudo apt-get install ros-$ROS_DISTRO-octomap-msgs ros-$ROS_DISTRO-octomap-ros ros-$ROS_DISTRO-geographic-msgs -y
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

## Dependencies for Behavior Tree
echo "\n Installing BT Dependencies \n\n"
sudo apt-get install ros-$ROS_DISTRO-ros-type-introspection ros-$ROS_DISTRO-nmea-msgs ros-$ROS_DISTRO-mavlink ros-$ROS_DISTRO-geographic-msgs -y
sudo apt-get install ros-$ROS_DISTRO-mavros
sudo apt-get install qtbase5-dev libqt5svg5-dev -y
sudo apt install libdw-dev libann-dev -y
sudo apt-get install ros-noetic-geographic-msgs ros-noetic-nmea-msgs

sudo apt-get install libqt5charts5-dev libqt5widgets5
cd ~
git clone https://github.com/robotics-upo/dbscan_line
cd dbscan_line
mkdir build
cd build
cmake ..
make
sudo make install
cd ~/marsupial_ws/src

if [ $1 == "no_git" ]; then
   echo "Skipping git cloning"
else
    # For localization stuff
    git clone -noetic https://github.com/robotics-upo/dll.git
    git clone https://github.com/robotics-upo/odom_to_tf.git

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
    git clone -b feat_uav_planner_maths https://github.com/SaimonMR/rrt_star_planners.git

    # To install Marsupial Optimizer
    echo "\n Installing Marsupial Optimizer \n\n"
    git clone -b develop_chur https://github.com/robotics-upo/marsupial_optimizer.git

    # Installing marsupial mission interface
    echo "\n Installing marsupial mission interface \n\n"
    git clone https://github.com/robotics-upo/marsupial_mission_interface

    # To get action for actionlib
    echo "\n Installing UPO Actions \n\n"
    git clone -b marsupial https://github.com/robotics-upo/upo_actions.git

    #To get a marker in the desired frame_link
    echo "\n Installing UPO Markers \n\n"
    git clone https://github.com/robotics-upo/upo_markers.git

    # Get timed roslaunch
    git clone -b melodic-devel https://github.com/robotics-upo/timed_roslaunch.git

    # Get upo path tracker
    git clone -b simplified https://github.com/robotics-upo/upo_path_tracker.git

    # Get catenary checker
    git clone -b dt_new_maths  https://github.com/robotics-upo/catenary_checker.git
fi

