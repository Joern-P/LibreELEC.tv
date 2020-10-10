# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gst-plugins-bad"
PKG_VERSION="1.17.2"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="https://gstreamer.freedesktop.org/modules/gst-plugins-good.html"
PKG_URL="https://gstreamer.freedesktop.org/src/gst-plugins-bad/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain gstreamer gst-plugins-base"
PKG_LONGDESC="Good GStreamer plugins and helper libraries"

PKG_MESON_OPTS_TARGET="-Dgdk-pixbuf=disabled \
                       -Dqt5=disabled \
                       -Dpng=disabled \
                       -Dtinyalsa=disabled \
                       -Dsndfile=disabled \
                       -Dtaglib=disabled \
                       -Dexamples=disabled \
                       -Dtests=disabled \
                       -Dnls=disabled"

post_makeinstall_target(){
  # Clean up
  rm -rf ${INSTALL}/usr/share
}
