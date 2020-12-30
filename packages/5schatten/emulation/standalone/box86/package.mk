# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="box86"
PKG_VERSION="0546b1e2124b4090084182e34314c81ca1355c27"
PKG_SHA256=""
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/ptitSeb/box86"
PKG_URL="https://github.com/ptitSeb/box86/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This is an enhanced fork of DOSBox. It is currently in sync with revision 4156."
PKG_BUILD_FLAGS="-lto"

PKG_CMAKE_OPTS_TARGET="-DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo"

