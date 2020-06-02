# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="wireguard-linux-compat"
<<<<<<< HEAD
PKG_VERSION="v1.0.20200520"
PKG_SHA256="57ce87359640fe15b776cff824a1df7f5f30beb33708beff7eb46e27ecd0cb72"
=======
PKG_VERSION="v1.0.20200429"
PKG_SHA256="81daddcf1ad1095cbbb03917d4b1e2ee151341e1261b6e2394b1d73c1d61bf20"
>>>>>>> 8fa0ca9f46a3759e18396d534a8ec1778df69909
PKG_LICENSE="GPLv2"
PKG_SITE="https://www.wireguard.com"
PKG_URL="https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux libmnl"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="WireGuard VPN kernel module"
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  kernel_make KERNELDIR=$(kernel_path) -C src/ module
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp src/*.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
