#!/bin/sh

EXTERN_DRIVERS_SOURCES="http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0008-r8168-8.043.02.tar.bz2"

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract ."
 else
if [ -f $1 ] ; then
        #NAME=${1%.*}
        #mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2) tar xvjf $1 ;;
          *.tar.gz) tar xvzf $1 ;;
          *.tar.xz) tar xvJf $1 ;;
          *.lzma) unlzma $1 ;;
          *.bz2) bunzip2 $1 ;;
          *.rar) unrar x -ad $1 ;;
          *.gz) gunzip $1 ;;
          *.tar) tar xvf $1 ;;
          *.tbz2) tar xvjf $1 ;;
          *.tgz) tar xvzf $1 ;;
          *.zip) unzip $1 ;;
          *.Z) uncompress $1 ;;
          *.7z) 7z x $1 ;;
          *.xz) unxz $1 ;;
          *.exe) cabextract $1 ;;
          *) echo "extract: '$1' - unknown archive method" ;;
        esac
else
echo "$1 - file does not exist"
    fi
fi
}


mkdir -p /usr/src/addons
cd /usr/src/addons

for I in "${EXTERN_DRIVERS_SOURCES}"; do
	wget "${I}" -P /usr/src/addons/
done

for I in /usr/src/addons/*tar.*; do
	extract "${I}"
done

for dir in /usr/src/addons/*/
do
	dir=${dir%*/}
	echo ${dir##*/}

	cd $dir
	cd src || true
	make -j2
	make install
done

cd -
