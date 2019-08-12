#!/bin/bash

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
