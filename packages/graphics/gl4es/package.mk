# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gl4es"
PKG_VERSION="dab338dc5d16807a071454e6116faf09c37f8a31" 
PKG_SHA256=""
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/ptitSeb/gl4es/"
PKG_URL="https://github.com/ptitSeb/gl4es/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="a library provide OpenGL 2.x functionality for GLES2.0 accelerated Hardware"

PKG_CMAKE_OPTS_TARGET+="-DNOX11=1 -DDEFAULT_ES=2 -DODROID=1 -DUSE_CLOCK=ON "

post_makeinstall_target() {
  
  if [ $(ls -1q $INSTALL/usr/lib/libGL.so | wc -l) -gt 1 ]; then
    ln -sfv /var/lib/libmali/libGL.so $INSTALL/usr/lib/libGL.so
  fi
}


