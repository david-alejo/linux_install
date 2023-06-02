# This is a custom-made image for simulating the new version of VRX
# With ROS2, Ubuntu 22.04 (jammy) and new Gazebo
FROM osrf/ros:humble-desktop

# Install IGN Gazebo Garden
RUN apt-get update && sudo apt-get install lsb-release wget gnupg -y
RUN lsb_release -cs
RUN dpkg --print-architecture
RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN apt-get update && apt-cache search gz- && apt-get install gz-garden -y

# Clone the VRX repository and build it (TODO)
SHELL ["/bin/bash", "-c"]
RUN source /opt/ros/humble/setup.bash && cd .. && pwd
RUN sudo apt install pip -y && pip3 install Cython
RUN sudo rm -rf /usr/src/gmock /usr/src/gtest /usr/share/urdfdom   # Remove duplicates for Colcon
RUN mkdir -p ~/vrx_ws/src && cd ~/vrx_ws/src && pwd && git clone https://github.com/osrf/vrx && git clone https://github.com/gazebosim/ros_gz -b ros2
RUN apt install ros-humble-ros-gz-interfaces ros-humble-xacro ros-humble-joy-teleop sdformat13-sdf libsdformat13-dev python3-sdformat13 ros-humble-gps-msgs -y
RUN cd ~/vrx_ws && source /opt/ros/humble/setup.bash && GZ_VERSION=garden colcon build --merge-install --parallel-workers=1
RUN source ~/vrx_ws/install/local_setup.bash
  
# Test vrx sim
COPY start.bash /usr/bin 
RUN chmod 777 /usr/bin/start.bash && ls -l /root
ENTRYPOINT ["/usr/bin/start.bash"]
#CMD ["bash","/root/start.bash"]
#CMD ["ros2","launch","vrx_gz","usv_joy_teleop.py"]
