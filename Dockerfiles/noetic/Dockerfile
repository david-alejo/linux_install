#! /bin/bash
# Generated as suggested in: https://varhowto.com/install-ros-noetic-docker/ and https://hub.docker.com/_/ros
FROM osrf/ros:noetic-desktop-full

# Create workspace and download files
RUN apt-get update && apt-get install git -y

RUN cd ~/ && git clone https://github.com/david-alejo/linux_install

RUN cd ~/linux_install/scripts && ./install_ceres.sh
RUN git config --global credential.helper store
RUN cd ~ && git clone https://david-alejo:69e06abc98a5a5574f2a55508261fe5f72c6f0f1@github.com/robotics-upo/upo_path_tracker -b simplified
SHELL ["/bin/bash", "-c"]
RUN source /opt/ros/noetic/setup.sh
RUN cd ~/linux_install/scripts && git pull && ./install_marsupial.sh

RUN cd ~/marsupial_ws/src/ && git clone -b ignition https://github.com/robotics-upo/marsupial_simulator.git
RUN  cd ~/marsupial_ws/src/marsupial_simulator && git pull && script/setup_simulation.sh
# New packages I forgot (TODO: remove it)
RUN apt install ros-noetic-geographic-msgs ros-noetic-nmea-msgs gdb -y
RUN cd ~/marsupial_ws && source devel/setup.bash && export IGNITION_VERSION=fortress && catkin_make
