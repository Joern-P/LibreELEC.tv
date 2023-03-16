# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="libretro-dolphin-launcher"
PKG_VERSION="6d72f3093d33461821e4f7fde6d3308187e644b9"
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/RobLoach/libretro-dolphin-launcher"
PKG_URL="https://github.com/RobLoach/libretro-dolphin-launcher/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Launch Nintendo Wii and GameCube games through Dolphin native, directly from RetroArch."
#PKG_TOOLCHAIN="make"


PKG_LIBNAME="dolphin_launcher_libretro.so"
PKG_LIBPATH="libretro/${PKG_LIBNAME}"

#PKG_MAKE_OPTS_TARGET="-C libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
    cp -v ${PKG_LIBNAME} ${INSTALL}/usr/lib/libretro/
    #cp -v dolphin_launcher_libretro.info ${INSTALL}/usr/share/retroarch/coreinfo/
}
