#!/bin/sh
#
# Copyright (c) 2015
# Author: Victor Arribas <v.arribas.urjc@gmail.com>
# License: GPLv3 <http://www.gnu.org/licenses/gpl-3.0.html>

./make_packages_for.sh \
"libopencv-.*2.4|libopencv.*-dev|libcv-dev|libcv2.4|python-opencv" \
2.4.11 \
all \
"OpenCV fake-deb"
