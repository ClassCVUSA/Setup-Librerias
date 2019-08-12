#!/bin/bash

# PCL-lib
sudo apt -y install libboost-dev libeigen3-dev libflann-dev libvtk6-dev libvtk6-qt-dev libqhull-dev qtbase5-dev
 
sudo apt -y install libflann-dev libboost-all-dev libboost-dev libqhull-dev libeigen3-dev libvtk6-dev libvtk6-qt-dev libgtk-3-dev qtbase5-dev libgtkglext1-dev libpcap-dev libproj-dev libv4l-dev

git clone https://github.com/PointCloudLibrary/pcl.git
cd pcl
mkdir build && cd build
 
cmake ..
make -j4
sudo make install -j4

#ITK lib 
sudo apt -y install  cmake-curses-gui

wget https://github.com/InsightSoftwareConsortium/ITK/releases/download/v5.0.1/InsightToolkit-5.0.1.tar.gz

mkdir bin
cd bin
ccmake ..
make -j4
sudo make install





