#!/bin/sh
#
# Copyright (c) 2015
# Author: Victor Arribas <v.arribas.urjc@gmail.com>
# License: GPLv3 <http://www.gnu.org/licenses/gpl-3.0.html>


if [ -z "$1" ]
then
	echo "Usage: $0 <package regex> <version> <architecture> [description]" >&2
	exit 1
fi

set -e
set -u

pkgregex=${1}
version=${2:-1024}
arch=${3:-$(dpkg --print-architecture)}
description=${4:-fake-deb}


echo "$0 will process following packages:"
apt-cache search "$pkgregex" | awk '{print "\t"$1}'

echo "Press any key to continue (Ctr++C to exit)"
read response


apt-cache search "$pkgregex" | awk '{print $1}' | while read pkg
do
	echo "Processing $pkg"
	mkdir -p build/$pkg/DEBIAN
	cat<<EOF>build/$pkg/DEBIAN/control
Package: $pkg
Version: $version
Architecture: $arch
Maintainer: fake-deb
Description: $description
EOF
        dpkg --build build/$pkg
done


