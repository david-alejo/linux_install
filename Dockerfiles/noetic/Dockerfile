#! /bin/bash
# Generated as suggested in: https://varhowto.com/install-ros-noetic-docker/ and https://hub.docker.com/_/ros
FROM osrf/ros:noetic-desktop-full

# Create workspace and download files
RUN apt-get update && apt-get install git -y

RUN cd ~/ && git clone https://github.com/david-alejo/linux_install && echo hola

RUN cd ~/linux_install/scripts && ./install_ceres.sh
RUN git config --global credential.helper store
RUN cd ~ && git clone https://github.com/robotics-upo/upo_path_tracker -b simplified
SHELL ["/bin/bash", "-c"]
RUN source /opt/ros/noetic/setup.sh
RUN cd ~/linux_install/scripts && git pull && ./install_marsupial.sh && echo hola
RUN cd ~/marsupial_ws/src/upo_path_tracker && git pull
RUN cd ~/marsupial_ws/src/rrt_star_planners && git checkout feat_uav_planner_maths
RUN cd ~/marsupial_ws/src/lazy_theta_star_planners && git pull && echo hola
RUN source /opt/ros/noetic/setup.bash && cd ~/marsupial_ws && catkin_make -j4
RUN cd ~/marsupial_ws/src/ && git clone -b ignition https://github.com/robotics-upo/marsupial_simulator.git
RUN  cd ~/marsupial_ws/src/marsupial_simulator && git pull && script/setup_simulation.sh
RUN cd ~/marsupial_ws && source devel/setup.bash && export IGNITION_VERSION=fortress && catkin_make
RUN cd ~/linux_install/ && git pull && ~/linux_install/scripts/install_g2o.sh 
RUN sudo apt install ros-noetic-costmap-2d ros-noetic-amcl ros-noetic-map-server ros-noetic-urg-node
RUN sudo apt update && sudo apt upgrade && apt install ros-noetic-aruco

