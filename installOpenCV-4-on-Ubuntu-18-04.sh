#!/bin/bash

echo "OpenCV from Git Hub installation "
# Define OpenCV Version to install 
cvVersion="master"

# Clean build directories
rm -rf opencv/build
rm -rf opencv_contrib/build

# Create directory for installation
mkdir installation
mkdir installation/OpenCV-"$cvVersion"

# Save current working directory
cwd=$(pwd)

sudo apt -y update
sudo apt -y upgrade

sudo apt -y remove x264 libx264-dev
 
## Install dependencies
sudo apt -y install build-essential checkinstall cmake unzip pkg-config yasm ccache
sudo apt -y install git gfortran libblas-dev libblas3 
sudo apt -y install libopenblas-dev libopenblas-base
sudo apt -y install libjpeg8-dev libpng-dev 
sudo apt -y install default-jdk openjdk-11-jdk
 
sudo apt -y install software-properties-common
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt -y update
 
# Install Deeplearning devs
sudo apt -y install  libcaffe-cpu-dev caffe-cpu python3-caffe-cpu

sudo apt -y install libjasper1 libjasper-dev
sudo apt -y install libtiff-dev
 
sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt -y install libxine2-dev libv4l-dev 
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd "$cwd"
 
sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install liblapack-dev liblapack3 liblapacke-dev libtmglib-dev libtmglib3
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev 
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils 
sudo apt -y install libgtk-3-dev libgtk-3-dev
#sudo apt-get install libvtk7-dev libvtk7-t-dev
 
# Optional dependencies
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
sudo apt -y install libtesseract-dev tesseract-ocr-eng tesseract-ocr-spa libtesseract4
sudo apt -y install libleptonica-dev liblept5  
sudo apt -y install -y libopenexr-dev openexr
sudo apt -y install libcmrt-dev libcmrt1
sudo apt -y install libgdal-dev
sudo apt -y install libantlr-dev

sudo apt -y install -y python-dev python-pip
sudo apt -y install python3-dev python3-pip python3-venv

sudo -H pip3 install -U pip numpy
sudo apt -y install python3-testresources

sudo apt -y install -y python-dev python-pip
sudo apt -y install -y python3-dev python3-pip

sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy

cd $cwd
############ For Python 3 ############
# create virtual environment
#python3 -m venv OpenCV-"$cvVersion"-py3
#echo "# Virtual Environment Wrapper" >> ~/.bashrc
#echo "alias workoncv-$cvVersion=\"source $cwd/OpenCV-$cvVersion-py3/bin/activate\"" >> ~/.bashrc
#source "$cwd"/OpenCV-"$cvVersion"-py3/bin/activate

# now install python libraries within this virtual environment
#pip install numpy scipy matplotlib scikit-image scikit-learn ipython dlib --user
 
# quit virtual environment
#deactivate

######################################

git clone https://github.com/opencv/opencv.git
cd opencv
git checkout $cvVersion
cd ..
 
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout $cvVersion
cd ..

cd opencv
mkdir build
cd build

#cmake -D CMAKE_BUILD_TYPE=RELEASE  \
#      -D CMAKE_INSTALL_PREFIX=/usr/local \
      #-D CMAKE_INSTALL_PREFIX=$cwd/installation/OpenCV-"$cvVersion" \      
      #-D OPENCV_PYTHON3_INSTALL_PATH=$cwd/OpenCV-$cvVersion-py3/lib/python3.6/site-packages \
      #-D WITH_TBB=ON
      #-D WITH_V4L=ON
      #-D WITH_LIBV4L=ON

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON \
      -D OPENCV_GENERATE_PKGCONFIG=YES ..
      -D WITH_QT=ON 
      -D WITH_OPENGL=ON
      -D INSTALL_C_EXAMPLES=ON
      -D INSTALL_PYTHON_EXAMPLES=ON
      -D BUILD_EXAMPLES=ON
      -D INSTALL_TESTS=ON 
      -D WITH_GDAL=ON 
      -D WITH_OPENCL_SVM=ON
      -D WITH_VTK=ON 
      -D ENABLE_SSE=ON
      -D ENABLE_SSE2=ON
      -D ENABLE_SSE3=ON
      -D ENABLE_SSSE3=ON
      -D ENABLE_SSE41=ON
      -D ENABLE_SSE42=ON
      -D WITH_OPENMP=ON
      -D WITH_GTK=ON
      -D WITH_GTK_2_X=ON
      -D WITH_EIGEN=ON
      -D ENABLE_FAST_MATH=OFF
      -D CUDA_FAST_MATH=OFF
      -D HAVE_CUFFT=YES
      -D WITH_CUFFT=OFF
      -D HAVE_CUBLAS=YES
      -D WITH_CUBLAS=OFF 
      -D HAVE_NVCUVID=OFF
      -D WITH_NVCUVID=OFF
      -D WITH_OPENCLAMDFFT=OFF
      -D WITH_OPENCLAMDBLAS=OFF
      -D WITH_OPENNI=OFF
      -D WITH_OPENNI2=OFF 
      -D CUDA_GENERATION=OFF
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \ ..
make -j$(nproc)
#make install








