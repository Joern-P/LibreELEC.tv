# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rga"
PKG_VERSION="1fc02d56d97041c86f01bc1284b7971c6098c5fb"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rockchip-linux/linux-rga"
PKG_URL="https://github.com/rockchip-linux/linux-rga/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libdrm"

PKG_LONGDESC="An Open Source 2D raster graphic acceleration from Rockchip."


make_target() {
	${CXX} ${CXXFLAGS} ${LDFLAGS} \
		-fPIC -shared -Wl,-soname,librga.so.0 \
		$(find . -name "*.cpp") -o librga.so.0 \
		-I$SYSROOT_PREFIX/libdrm -ldrm
}

  makeinstall_target() {

  	mkdir -p $INSTALL/usr/lib/
    	cp -PR librga.so.0 $INSTALL/usr/lib/
	ln -s $INSTALL/usr/lib/librga.so.0 $INSTALL/usr/lib/librga.so
	cp -PR librga.so.0 $SYSROOT_PREFIX/usr/lib/
	ln -s $SYSROOT_PREFIX/usr/lib/librga.so.0 $SYSROOT_PREFIX/usr/lib/librga.so
	mkdir -p $SYSROOT_PREFIX/usr/include/rga/
	cp -PR *.h $SYSROOT_PREFIX/usr/include/rga/


}


                       
