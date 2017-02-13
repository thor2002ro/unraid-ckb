#!/bin/sh

KERNEL_VERSION=${KERNEL_VERSION:-`uname -r`}

mkdir -p /tmp/build || true
cd /tmp/build

xzcat /boot/bzroot | cpio -m -i -d -H newc --no-absolute-filenames
rsync -av --delete /lib/modules/${KERNEL_VERSION}/ lib/modules/${KERNEL_VERSION}/

find . | cpio -o -H newc | xz --check=crc32 --x86 --lzma2=preset=9e > /boot/bzroot_custom
cp /usr/src/kernel/arch/x86/boot/bzImage /boot/bzimage_custom
cd -
