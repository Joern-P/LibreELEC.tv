# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rga"
PKG_VERSION="2134dde256e10bf54c490d06f44f22a6859c83eb"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rockchip-linux/linux-rga"
PKG_URL="https://github.com/rockchip-linux/linux-rga/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libdrm"

PKG_LONGDESC="An Open Source 2D raster graphic acceleration from Rockchip."


configure_package() {
  PKG_MESON_SCRIPT="${PKG_BUILD}/meson.build"
}

PKG_MESON_OPTS_TARGET="-Dlibdrm=true"
                      
