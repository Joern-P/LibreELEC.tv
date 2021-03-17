# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmali"
PKG_VERSION="c3b4a820e1cfd8e049c5321808c29713c25e2cd0"
PKG_SHA256=""
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/LibreELEC/libmali"
PKG_URL="https://github.com/rockchip-linux/libmali/archive/$PKG_VERSION.tar.gz"
PKG_LONGDESC="OpenGL ES user-space binary for the ARM Mali GPU family"
PKG_STAMP="$MALI_FAMILY"

PKG_DEPENDS_TARGET="libdrm patchelf:host"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -v $PKG_DIR/scripts/libmali-setup $INSTALL/usr/bin

  # Add missing DT_SONAME libMali.so
  patchelf --debug --set-soname libMali.so ${INSTALL}/usr/lib/libmali-*.so
  patchelf --debug --set-soname libMali.so ${SYSROOT_PREFIX}/usr/lib/libmali-*.so
}

post_install() {
  enable_service libmali-setup.service
}

