#!/bin/bash
source /opt/intel/computer_vision_sdk_2018.1.249/bin/setupvars.sh
mkdir build 
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j 2
