# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gl4es"
PKG_VERSION="215b5356ea300ec35c9db2f649964a1bc4d30182" 
PKG_SHA256=""
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/ptitSeb/gl4es/"
PKG_URL="https://github.com/ptitSeb/gl4es/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="a library provide OpenGL 2.x functionality for GLES2.0 accelerated Hardware"

PKG_CMAKE_OPTS_TARGET+="-DNOX11=1 -DDEFAULT_ES=2 -DODROID=1 -DUSE_CLOCK=ON "


