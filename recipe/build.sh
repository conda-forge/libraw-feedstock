#!/bin/bash

autoreconf --install

if [ `uname` == Darwin ]; then
	USE_OPENMP=false
else
	USE_OPENMP=true
fi;

./configure --prefix="${PREFIX}" --enable-openmp=$USE_OPENMP

make -j${CPU_COUNT}
make install
