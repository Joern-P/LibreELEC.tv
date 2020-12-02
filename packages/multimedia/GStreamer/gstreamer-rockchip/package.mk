# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gstreamer-rockchip"
PKG_VERSION="0a087b2ef855904382dd265d3bbe75aac7abc05d"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rockchip-linux/gstreamer-rockchip"
PKG_URL="https://github.com/JeffyCN/mirrors/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain rkmpp gstreamer gst-plugins-base gst-libav gst-plugins-good gst-plugins-bad"
PKG_LONGDESC="The Gstreamer hardware encoder/decoder plugins for Rockchip platform."
PKG_TOOLCHAIN="autotools"
PKG_CONFIGURE_OPTS_TARGET="--enable-rockchipmpp"

pre_configure_target() {
  CFLAGS="$CFLAGS -fcommon"
}
