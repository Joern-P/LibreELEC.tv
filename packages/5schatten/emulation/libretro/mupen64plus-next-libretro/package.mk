# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="mupen64plus-next-libretro"
PKG_VERSION="a9cb874"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro-nx"
PKG_URL="https://github.com/libretro/mupen64plus-libretro-nx.git"
PKG_DEPENDS_TARGET="toolchain nasm:host"
PKG_SECTION="escalade"
PKG_SHORTDESC="mupen64plus + RSP-HLE + GLideN64 + libretro"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+speed -lto +pic"
PKG_GIT_CLONE_BRANCH="rebase"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION}"

pre_make_target() {
case $PROJECT in
  RPi)
    if [ "${DEVICE}" = "RPi2" ]; then
      PKG_MAKE_OPTS_TARGET+=" platform=rpi2-mesa"
    elif [ "${DEVICE}" = "RPi4" ]; then
      PKG_MAKE_OPTS_TARGET+=" platform=rpi4-mesa"
    fi
    ;;
  Generic)
    PKG_MAKE_OPTS_TARGET+=" HAVE_PARALLEL_RSP=1 HAVE_PARALLEL_RDP=1"
    ;;
  OdroidXU3)
    PKG_MAKE_OPTS_TARGET+=" platform=unix FORCE_GLES3=1 HAVE_GL=0 HAVE_NEON=1"
    ;;
  Rockchip)
    CFLAGS+=" -DARM -D__NEON_OPT"
    if [ "${ARCH}" = "aarch64" ]; then
      PKG_MAKE_OPTS_TARGET+=" platform=unix FORCE_GLES3=1 HAVE_GL=0"
    elif [ "${ARCH}" = "arm" ]; then
      PKG_MAKE_OPTS_TARGET+=" platform=unix FORCE_GLES3=1 HAVE_GL=0 HAVE_NEON=1"
    fi
    ;;
esac
}


makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
