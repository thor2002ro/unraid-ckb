#!/bin/sh

cd /usr/src/kernel

make oldconfig
make menuconfig

make -j12 bzImage
make -j12
make -j12 modules
make modules_install

cd -
