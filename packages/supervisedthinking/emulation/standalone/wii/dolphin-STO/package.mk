# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dolphin-STO"
PKG_VERSION="41272dc5f1b62f4a5a0562cc29eb3e83367d0f14" #r5.0-18407
PKG_ARCH="any"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/dolphin-emu/dolphin"
PKG_URL="https://github.com/dolphin-emu/dolphin.git"
PKG_DEPENDS_TARGET="toolchain linux glibc sdl2 systemd openal-soft-system libevdev curl ffmpeg libpng zlib bzip2 zstd bluez pulseaudio alsa-lib libogg-system libvorbis-system"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements."
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="master"
PKG_GIT_CLONE_SINGLE="yes"
PKG_BUILD_FLAGS="+gold"

pre_configure_target() {
PKG_CMAKE_OPTS_TARGET+=" -DENABLE_HEADLESS=ON \
                         -DENABLE_EVDEV=ON \
                         -DUSE_DISCORD_PRESENCE=OFF \
                         -DBUILD_SHARED_LIBS=OFF \
                         -DUSE_MGBA=OFF \
                         -DLINUX_LOCAL_DEV=ON \
                         -DENABLE_TESTS=OFF \
                         -DENABLE_LLVM=OFF \
                         -DENABLE_ANALYTICS=OFF \
                         -DENABLE_LTO=ON \
                         -DENABLE_QT=OFF \
                         -DENCODE_FRAMEDUMPS=OFF \
                         -DENABLE_CLI_TOOL=OFF \
                         -DENABLE_X11=OFF"
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed  -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
  
}

post_makeinstall_target() {
  # Copy scripts & config files
  mkdir -p ${INSTALL}/usr/config/dolphin-emu
    cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
    cp -PR ${PKG_DIR}/config/* ${INSTALL}/usr/config/dolphin-emu/

  # Clean up
  safe_remove ${INSTALL}/usr/share/applications
  safe_remove ${INSTALL}/usr/share/icons
}

