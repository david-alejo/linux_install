# This is a custom-made image for simulating the new version of VRX
# With ROS2, Ubuntu 24.04 and new Gazebo
FROM osrf/ros:jazzy-desktop-full

# Install IGN Gazebo Garden
RUN apt-get update && sudo apt-get install lsb-release wget gnupg nano inetutils-ping -y
RUN lsb_release -cs
RUN dpkg --print-architecture
RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN apt-get update && apt-cache search gz- && apt-get install gz-harmonic -y

RUN apt install ros-jazzy-ros-gz-interfaces ros-jazzy-xacro ros-jazzy-joy-teleop ros-jazzy-gps-msgs -y


RUN apt install libspdlog-dev libceres-dev -y    

# By default the DockerFile uses the root as user. 
# We will add a custom user so that we work in user space by default
# And then switch to that user
# Source: https://www.docker.com/blog/understanding-the-docker-user-instruction/
RUN useradd -ms /bin/bash jazzy
# Sometimes it is good to add a password so that we can use sudo to install things
# To this end, uncomment the following line, remove extra ### and change the password 
RUN echo "jazzy:jazzy" | chpasswd  
#### Remove #### to change the password
RUN adduser jazzy sudo & adduser jazzy dialout & adduser jazzy plugdev & echo Hi
RUN usermod -aG sudo jazzy

USER jazzy

# We will use the home directory as work directory
# So that the docker starts at HOME!
WORKDIR "/home/jazzy"

