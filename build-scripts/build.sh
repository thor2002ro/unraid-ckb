#!/bin/sh

./1-download-kernel.sh
./2-patch-kernel.sh
./3-build-kernel.sh
./4-build-others.sh
./5-make-new-bzroot-bzimage.sh
