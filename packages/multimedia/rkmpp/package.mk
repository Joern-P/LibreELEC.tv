# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rkmpp"
PKG_VERSION="aaa4c8e9a8d8a024f192bead2c45615173378e8c"
PKG_SHA256=""
PKG_ARCH="arm aarch64"
PKG_LICENSE="APL"
PKG_SITE="https://github.com/rockchip-linux/mpp"
PKG_URL="https://github.com/rockchip-linux/mpp/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libdrm"
PKG_LONGDESC="rkmpp: Rockchip Media Process Platform (MPP) module"

if [ "$DEVICE" = "RK3588" ]; then
  PKG_ENABLE_VP9D="ON"
else
  PKG_ENABLE_VP9D="OFF"
fi

PKG_CMAKE_OPTS_TARGET="-DCMAKE_BUILD_TYPE=Release \
                       -DENABLE_SHARED=ON \
                       -DENABLE_VP9D=ON \
                       -DBUILD_TEST=ON " 

