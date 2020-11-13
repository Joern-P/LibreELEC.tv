# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="bchunk"
PKG_VERSION="1.2.2"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="http://he.fi/bchunk/"
PKG_URL="http://he.fi/bchunk/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Tool to convert a CD image in a .bin/.cue format to a set of .iso and .cdr tracks."

makeinstall_target() {
  :
}

make_target() {
  make $PKG_MAKE_OPTS_TARGET CC=$CC LD=$CC
}
