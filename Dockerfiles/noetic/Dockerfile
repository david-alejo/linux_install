#! /bin/bash
# Generated as suggested in: https://varhowto.com/install-ros-noetic-docker/ and https://hub.docker.com/_/ros
FROM osrf/ros:noetic-desktop-full

# Create workspace and download files
RUN apt-get update && apt-get install git -y

RUN cd ~/ && git clone https://github.com/david-alejo/linux_install && apt-get install cmake

RUN cd ~/linux_install/scripts && ./install_ceres.sh
RUN git config --global credential.helper store
RUN cd ~ && git clone https://github.com/robotics-upo/upo_path_tracker -b simplified
SHELL ["/bin/bash", "-c"]
RUN source /opt/ros/noetic/setup.sh
RUN cd ~/linux_install/scripts && git pull && ./install_marsupial.sh no_git 
RUN cd ~/linux_install/ && git pull && ~/linux_install/scripts/install_g2o.sh 
RUN apt install ros-noetic-costmap-2d ros-noetic-amcl ros-noetic-map-server ros-noetic-urg-node -y
RUN apt update && apt upgrade -y && apt install ros-noetic-aruco xterm gdb -y
RUN cd ~/marsupial_ws/src/ && git clone -b ignition https://github.com/robotics-upo/marsupial_simulator.git
RUN  cd ~/marsupial_ws/src/marsupial_simulator && git pull && script/setup_simulation.sh

