#! /bin/bash
#####################################################################################################################################################################################
sudo apt-get install cmake libeigen3-dev
sudo apt-get install libsuitesparse-dev qtdeclarative5-dev qt5-qmake libqglviewer-dev libcholmod3.0.6 liblapack-dev libblas-dev

cd ~
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o
mkdir build
cd build
#cmake ..
cmake .. -DG2O_BUILD_EXAMPLES=yes
# cmake -DBUILD_WITH_MARCH_NATIVE=ON ..
make
# make -j4
sudo make install
