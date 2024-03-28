# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dolphinsa"
PKG_VERSION="3948ac9513b31122e031269c912b206c8389eda4" #r5.0-18407
PKG_ARCH="x86_64 aarch64"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/dolphin-emu/dolphin"
PKG_URL="https://github.com/dolphin-emu/dolphin.git"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd openal-soft-system libevdev curl sdl2 ffmpeg libpng zlib bzip2 zstd bluez pulseaudio alsa-lib libogg-system libvorbis-system"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements."
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="master"
PKG_GIT_CLONE_SINGLE="yes"
PKG_BUILD_FLAGS="+gold"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-D CMAKE_BUILD_TYPE=Release
                         -D CMAKE_CXX_FLAGS=-march=armv8.2-a \
                         -D CMAKE_C_FLAGS=-march=armv8.2-a \
                         -D BUILD_SHARED_LIBS=OFF \
                         -D USE_MGBA=OFF \
                         -D USE_UPNP=OFF \
                         -D ENABLE_TESTS=OFF \
                         -D ENABLE_AUTOUPDATE=OFF \
                         -D ENABLE_X11=OFF \
                         -D ENABLE_VULKAN=OFF \
                         -D ENABLE_LLVM=OFF
                         -D ENABLE_TESTS=off \
                         -D ENABLE_QT=OFF \
                         -D USE_DISCORD_PRESENCE=off \
                         -D ENABLE_ANALYTICS=OFF"
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed  -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
 
  
}


post_makeinstall_target() {
  # Copy scripts & config files
  mkdir -p ${INSTALL}/usr/config/dolphin-emu
    #cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
    cp -PR ${PKG_DIR}/config/* ${INSTALL}/usr/config/dolphin-emu/

  # Clean up
  safe_remove ${INSTALL}/usr/share/applications
  safe_remove ${INSTALL}/usr/share/icons
}

