# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dvb-firmware"
PKG_VERSION="2c8f3b3b2b01744190227195f26c1c03ac32c2e6"
PKG_SHA256=""
PKG_LICENSE="Free-to-use"
PKG_SITE="https://github.com/LibreELEC/dvb-firmware"
PKG_URL="https://github.com/JOERN-P/dvb-firmware/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="dvb-firmware: firmwares for various DVB drivers"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  PKG_FW_DIR="$INSTALL/$(get_kernel_overlay_dir)/lib/firmware"
  mkdir -p "$PKG_FW_DIR"
    cp -a "$PKG_BUILD/firmware/"* "$PKG_FW_DIR"
}


