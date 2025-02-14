# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rkmpp"
PKG_VERSION="70b572a2c0906e284fa5a376ca5cda3649a18b02"
PKG_SHA256=""
PKG_ARCH="arm aarch64"
PKG_LICENSE="APL"
PKG_SITE="https://github.com/rockchip-linux/mpp"
PKG_URL="https://github.com/rockchip-linux/mpp/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libdrm"
PKG_LONGDESC="rkmpp: Rockchip Media Process Platform (MPP) module"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr \
		       -DCMAKE_BUILD_TYPE=Release \
                       -DENABLE_SHARED=ON \
                       -DBUILD_TEST=OFF " 

