
#!/bin/bash

# 1. Download repository into the marsupial_ws directory
DESTINATION=${1-$HOME/marsupial_ws}

echo "Installation of DJI library and download the ROS package. Cloning into the directory: $DESTINATION/src\ "
cd $DESTINATION/src && git clone https://github.com/robotics-upo/Onboard-SDK-ROS.git

# 1a. necessary packages
cd $DESTINATION
source devel/setup.bash
export IGNITION_VERSION=fortress
catkin_make

# Install the CMake, etc.

if [ -d $DESTINATION/src/Onboard-SDK-ROS/Onboard-SDK-3.8.1-build ]
cd $DESTINATION/src/Onboard-SDK-ROS/Onboard-SDK-3.8.1-build
make
if [ "$EUID" -eq 0 ]
then make install
else sudo make install
fi
