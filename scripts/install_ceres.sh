#! /bin/bash
# CERES Solver Installation
echo "\n Installing CERES \n\n"
## CMake
sudo apt-get install cmake
## google-glog + gflags
sudo apt-get install libgoogle-glog-dev libgflags-dev -y
## BLAS & LAPACK
sudo apt-get install libatlas-base-dev -y
## Eigen3
sudo apt-get install libeigen3-dev -y
## SuiteSparse and CXSparse (optional)
sudo apt-get install libsuitesparse-dev -y


cd ~
git clone https://ceres-solver.googlesource.com/ceres-solver
# tar zxf ceres-solver-2.0.0.tar.gz
mkdir ceres-bin
cd ceres-bin
# cmake ../ceres-solver-2.0.0
cmake ../ceres-solver
make -j3
make test
## Optionally install Ceres, it can also be exported using CMake which
## allows Ceres to be used without requiring installation, see the documentation
## for the EXPORT_BUILD_DIR option for more information.
sudo make install
