# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rga"
PKG_VERSION="ca16a702c76eb784e870772c948012c4c27076da"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rockchip-linux/linux-rga"
PKG_URL="https://github.com/JeffyCN/mirrors/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain "

PKG_LONGDESC="An Open Source 2D raster graphic acceleration from Rockchip."


configure_package() {
  PKG_MESON_SCRIPT="${PKG_BUILD}/meson.build"
}

PKG_MESON_OPTS_TARGET=" --prefix=/usr \
    			--libdir=lib \
    			--buildtype=release \
			--default-library=shared \
    		        -Dcpp_args=-fpermissive \
   	                -Dlibdrm=false \
                        -Dlibrga_demo=false"

