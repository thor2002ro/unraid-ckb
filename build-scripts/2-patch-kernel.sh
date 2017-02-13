#!/bin/sh

cd /usr/src/

rsync -av /usr/src/linux-`uname -r`/ kernel/
cd kernel
for p in $(find . -type f -iname "*.patch"); do
	patch -p 1 < $p
done

cd -
