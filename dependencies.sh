#!/bin/bash

echo "installed VTK , ITK , PCL libs"

#https://www.mesa3d.org/install.html#prereq-general
#wget ftp://ftp.freedesktop.org/pub/mesa/mesa-19.1.4.tar.xz
#tar xf mesa-19.1.4.tar.xz

wget https://www.vtk.org/files/release/8.2/VTK-8.2.0.tar.gz
wget https://www.vtk.org/files/release/8.2/VTKData-8.2.0.tar.gz
wget https://www.vtk.org/files/release/8.2/VTKLargeData-8.2.0.tar.gz

tar zxvf VTK-8.2.0.tar.gz
tar zxvf VTKData-8.2.0.tar.gz
tar zxvf VTKLargeData-8.2.0.tar.gz
mkdir VTK-8-build
cd VTK-8-build
cmake ../VTK-8.2.0
-DBUILD_DOCUMENTATION:BOOL=OFF \
-DBUILD_EXAMPLES:BOOL=ON \
-DBUILD_SHARED_LIBS:BOOL=ON \
-DBUILD_TESTING:BOOL=ON \
-DVTK_Group_Imaging:BOOL=ON \
-DVTK_Group_MPI:BOOL=ON \
-DVTK_Group_Qt:BOOL=ON \
-DVTK_Group_Rendering:BOOL=ON \
-DVTK_Group_StandAlone:BOOL=ON \
-DVTK_Group_Tk:BOOL=ON \
-DVTK_Group_Views:BOOL=ON \
-DVTK_Group_Web:BOOL=ON \
-DVTK_USE_LARGE_DATA:BOOL=ON \
-DVTK_USE_TK:BOOL=ON \
-DVTK_WRAP_PYTHON:BOOL=ON \
-DVTK_WRAP_TCL:BOOL=OFF
make -j4
sudo make install
cd ..
sudo rm -R VTK-8.2.0.tar.gz
sudo rm -R VTKData-8.2.0.tar.gz
sudo rm -R VTKLargeData-8.2.0.tar.gz
sudo rm -R VTK-8-build
sudo rm -R VTK-8.2.0


#sudo apt -y install  libmgl-glut7.5.0
#wget https://sourceforge.net/projects/aruco/files/3.1.2/aruco-3.1.2.zip
#unzip aruco-3.1.2.zip
#cd aruco-3.1.2
#mkdir build
#cd build
#cmake ..
#make
#sudo make install

#echo '/usr/local/lib' | sudo tee --append /etc/ld.so.conf.d/aruco.conf
#sudo ldconfig
#echo 'PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig' | sudo tee --append ~/.bashrc 
# echo 'PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig' | sudo tee --append ~/etc/.bashrc 
#echo 'export PKG_CONFIG_PATH' | sudo tee --append ~/.bashrc
#source ~/.bashrc






