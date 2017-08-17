#!/bin/bash -eu

OPENCV_VER=3.2.0

sudo apt-get update
# compiler
sudo apt-get install -y build-essential
# required
sudo apt-get install -y zip cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
# optional
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
mkdir -p /tmp/opencv3_installer && cd /tmp/opencv3_installer
wget https://github.com/opencv/opencv/archive/${OPENCV_VER}.zip -O opencv${OPENCV_VER}.zip
unzip opencv${OPENCV_VER}.zip
wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VER}.zip -O opencv_contrib${OPENCV_VER}.zip
unzip opencv_contrib${OPENCV_VER}.zip
cd /tmp/opencv3_installer/opencv-${OPENCV_VER} && mkdir build && cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${OPENCV_VER}/modules  -DWITH_TBB=ON -DWITH_V4L=ON -DWITH_OPENGL=ON ..
make -j4
sudo make install
#echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf
sudo ldconfig
#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
mkdir -p ~/tmp && mv /tmp/opencv3_installer ~/tmp/
