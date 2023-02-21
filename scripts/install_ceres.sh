#! /bin/bash
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
