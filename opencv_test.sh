#!/bin/bash -eu
python -c 'import cv2;print(cv2.__version__)'
[ -e ./test/opencv_cvt_img.out ] && rm ./test/opencv_cvt_img.out
cd ./test && make && ./opencv_cvt_img.out && [ -e gray_image.jpg ] && echo 'OpenCV3 Installed'
