#!/bin/bash -eu
DIR=$(cd $(dirname $0); pwd) && echo $DIR
python -c 'import cv2;print(cv2.__version__)'
[ -e $DIR/test/opencv_cvt_img.out ] && rm $DIR/test/opencv_cvt_img.out
cd $DIR/test && make && ./opencv_cvt_img.out && [ -e gray_image.jpg ] && echo 'OpenCV3 Installed'
