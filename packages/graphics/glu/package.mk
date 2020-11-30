# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="glu"
PKG_VERSION="2fed2bda2b725d2b9e32c435b48d5141cc95827f" 
PKG_SHA256=""
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/ptitSeb/glu/"
PKG_URL="https://github.com/ptitSeb/GLU/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="libglu is the The OpenGL utility library"

PKG_CONFIGURE_OPTS_TARGET="--disable-silent-rules \
                           --disable-debug \
                           --disable-osmesa \
                           --with-gnu-ld"
