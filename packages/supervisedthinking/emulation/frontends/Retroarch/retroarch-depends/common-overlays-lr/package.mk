# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="common-overlays-lr"
PKG_VERSION="c266abf4d7f9286fb6fbcfb57647cd9c80c45530"
PKG_SHA256="0df931f386ebfcf2e8bedd50406e9fc513478aecd603cb27877035a4de4fe7cc"
PKG_LICENSE="CC-BY-4.0 License"
PKG_SITE="https://github.com/libretro/common-overlays"
PKG_URL="https://github.com/libretro/common-overlays/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="Collection of overlay files for use with libretro frontends, such as RetroArch."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  make -C ${PKG_BUILD} install INSTALLDIR="${INSTALL}/usr/share/retroarch/overlays"
}

post_makeinstall_target() {
  for PKG_OVERLAY_FILES in \
    gamepads ipad keyboards misc wii
  do
    safe_remove ${INSTALL}/usr/share/retroarch/overlays/${PKG_OVERLAY_FILES}
  done 
}
