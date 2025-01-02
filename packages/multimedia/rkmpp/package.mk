# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rkmpp"
PKG_VERSION="331ee68fdde99ca85b8a387b0db863f10235425f"
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
                       -DBUILD_TEST=ON " 

