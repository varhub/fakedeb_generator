#!/bin/sh
#
# Copyright (c) 2015
# Author: Victor Arribas <v.arribas.urjc@gmail.com>
# License: GPLv3 <http://www.gnu.org/licenses/gpl-3.0.html>

version=2.4.11
arch=amd64

apt-cache search libopencv | awk '{print $1}' | while read pkg
do
	echo "Processing $pkg"
	mkdir -p build/$pkg/DEBIAN
	cat<<EOF>build/$pkg/DEBIAN/control
Package: $pkg
Version: $version
Architecture: $arch
Maintainer: fake-deb
Description: OpenCV fake-deb
EOF
        dpkg --build build/$pkg
done


