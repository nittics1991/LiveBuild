#
#   xubuntu usb使用時
#
#
#!/bin/bash

#buster
LIVE_BUILD_PACKAGE=http://deb.debian.org/debian/pool/main/l/live-build/live-build_20190311_all.deb

#bullseye
#LIVE_BUILD_PACKAGE=http://deb.debian.org/debian/pool/main/l/live-build/live-build_20191221_all.deb

cd $(dirname "$0")

#dctrl-toolsはパッケージ調査用
#grep-aptavail -n -sPackage -FPriority standard | sort
sudo apt install -y debootstrap syslinux-utils dctrl-tools

[[ "$?" != 0 ]] && echo "apt error" && exit "$?"

if [[ ! -e $LIVE_BUILD_PACKAGE ]]
then
    wget -nc -O ../cache/live-build.deb "${LIVE_BUILD_PACKAGE}"
fi

sudo apt install -y ../cache/live-build.deb

[[ "$?" != 0 ]] && echo "apt error:local" && exit "$?"

sudo mount -o remount,dev /dev/sda
