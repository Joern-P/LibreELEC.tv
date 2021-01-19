# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="libvpx-system"
PKG_VERSION="ecbb0e0e2a9b0500db432922b436d1f59ae9b011"
PKG_SHA256=""
PKG_LICENSE="BSD"
PKG_SITE="https://www.webmproject.org"
PKG_URL="https://github.com/webmproject/libvpx/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="WebM VP8/VP9 Codec"

if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" nasm:host"
fi

configure_target() {
  # Fix linking shared lib at v1.8.0
  LDFLAGS+=" -lpthread"

  case ${ARCH} in
    aarch64)
      PKG_TARGET_NAME_LIBVPX="arm64-linux-gcc"
      ;;
    arm)
      PKG_TARGET_NAME_LIBVPX="armv7-linux-gcc"
      ;;
    x86_64)
      PKG_TARGET_NAME_LIBVPX="x86_64-linux-gcc"
      ;;
  esac

  $PKG_CONFIGURE_SCRIPT --prefix=/usr \
                        --extra-cflags="${CFLAGS}" \
                        --as=nasm \
                        --target=${PKG_TARGET_NAME_LIBVPX} \
                        --disable-docs \
                        --disable-examples \
                        --enable-shared \
                        --disable-tools \
                        --disable-unit-tests \
                        --disable-vp8-decoder \
                        --disable-vp9-decoder \
                        --enable-vp8-encoder \
                        --enable-vp9-encoder \
                        --enable-ccache \
                        --enable-pic \
                        --enable-static \
                        --enable-vp8 \
                        --enable-vp9
}
