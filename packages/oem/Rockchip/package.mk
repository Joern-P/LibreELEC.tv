# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="Rockchip"
PKG_VERSION="1.0.5"
PKG_LICENSE="GPL-2.0-or-later"
PKG_DEPENDS_TARGET="toolchain rr-config-tool moonlight-qt sdl_gamecontrollerdb"
PKG_LONGDESC="Metapackage for various LibreELEC-RR OEM packages"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}

  # Install OEM config files & scripts
  cp -PRv ${PKG_DIR}/config/* ${INSTALL}
}

