# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gstreamer-rockchip"
PKG_VERSION="490375216e0e88decf0752147504bc5dba00312e"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rockchip-linux/gstreamer-rockchip"
PKG_URL="https://github.com/rockchip-linux/gstreamer-rockchip.git"
PKG_DEPENDS_TARGET="toolchain rkmpp gstreamer gst-plugins-base gst-libav"
PKG_LONGDESC="The Gstreamer hardware encoder/decoder plugins for Rockchip platform."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="autotools"
PKG_CONFIGURE_OPTS_TARGET="--enable-rockchipmpp"
