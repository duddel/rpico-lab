#!/bin/bash

if [ ! -d "build" ]; then
  mkdir build
  cd build
  cmake .. || exit $?
  cd -
fi

cd build
cmake --build . || exit $?
cd -
