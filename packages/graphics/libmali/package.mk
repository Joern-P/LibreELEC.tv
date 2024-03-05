# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmali"
PKG_VERSION="b9619b998cd9a019dacd6f5a4058c757ec0ed382"
PKG_SHA256="1386b968b45f2d0ffce05fbbdbc1059a747232f89d9078bad73a405b7cbaeede"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
MALI_LIB_VERSION="1.9.0"
PKG_SITE="https://github.com/LibreELEC/libmali"
PKG_URL="https://github.com/tsukumijima/libmali-rockchip/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="OpenGL ES user-space binary for the ARM Mali GPU family"

PKG_DEPENDS_TARGET="libdrm"
if [ "${TARGET_ARCH}" = "aarch64" ]; then
  INSTARCH="aarch64-linux-gnu"
elif [ "${TARGET_ARCH}" = "arm" ]; then
  INSTARCH="arm-linux-gnueabihf"
fi

PKG_MESON_OPTS_TARGET+=" -Darch=${TARGET_ARCH} \
                         -Dgpu=${MALI_FAMILY} \
                         -Dversion=${MALI_VERSION} \
                         -Dplatform=gbm \
                         -Dhooks=false \
                         -Dkhr-header=true"

post_makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
    cp -v ${PKG_DIR}/scripts/libmali-setup ${INSTALL}/usr/bin

  #if [ $(ls -1q ${INSTALL}/usr/lib/libmali-*.so | wc -l) -gt 1 ]; then
  #  ln -sfv /var/lib/libmali/libmali.so ${INSTALL}/usr/lib/libmali.so
  #fi
  for lib in libEGL.so.1 libgbm.so.1 libGLESv1_CM.so.1 libGLESv2.so.2 libMaliOpenCL.so.1
  do
    rm -f ${INSTALL}/usr/lib/${lib}
    ln -s libmali.so.${MALI_LIB_VERSION} ${INSTALL}/usr/lib/${lib}
    rm -f ${SYSROOT_PREFIX}/usr/lib/${lib}
    ln -s libmali.so.${MALI_LIB_VERSION} ${SYSROOT_PREFIX}/usr/lib/${lib}
  done
}

post_install() {
  enable_service libmali-setup.service
}
