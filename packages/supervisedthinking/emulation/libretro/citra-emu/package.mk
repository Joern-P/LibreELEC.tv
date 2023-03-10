# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2022-present BrooksyTech (https://github.com/brooksytech)

PKG_NAME="citra-emu"
PKG_VERSION="d7e1612c17b1acb5d5eb68bb046820db49aeea5e"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/citra"
PKG_URL="https://github.com/libretro/citra/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost"
PKG_SECTION="libretro"
PKG_SHORTDESC="Citra - Nintendo 3DS emulator for libretro"


if [ "${OPENGLES_SUPPORT}" = yes ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
fi


makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp citra_libretro.so ${INSTALL}/usr/lib/libretro/
}
