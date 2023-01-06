#!/bin/bash

if [ ! -d "build" ]; then
  mkdir build
  cd build
  cmake -DPICO_BOARD=pico_w .. || exit $?
  cd -
fi

cd build
cmake --build . || exit $?
cd -
