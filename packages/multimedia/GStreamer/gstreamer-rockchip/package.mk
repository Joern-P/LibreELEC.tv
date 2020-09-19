# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gstreamer-rockchip"
PKG_VERSION="8e5dffe926a773faed57543b9b5bcf60008bdebf"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rockchip-linux/gstreamer-rockchip"
PKG_URL="https://github.com/JeffyCN/mirrors/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain rkmpp gstreamer gst-plugins-base gst-libav"
PKG_LONGDESC="The Gstreamer hardware encoder/decoder plugins for Rockchip platform."
PKG_TOOLCHAIN="autotools"
PKG_CONFIGURE_OPTS_TARGET="--enable-rockchipmpp"
