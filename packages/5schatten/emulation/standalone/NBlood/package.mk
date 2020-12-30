# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="NBlood"
PKG_VERSION="716b2553b99ffa4c965684577d27292eced3152f" 
PKG_SHA256=""
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/nukeykt/NBlood"
PKG_URL="https://github.com/nukeykt/NBlood/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Blood port based on EDuke32"
PKG_TOOLCHAIN="manual"

make_target() {
  make CC=$CC CPP=$CPP
      }
