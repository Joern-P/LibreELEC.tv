# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="retroarch-assets"
PKG_VERSION="923b711dc6772a168d83dc8915e9260730fcf3a1"
PKG_SHA256="50e2628a09fef042981ad0efc1be9c5ebcf1a3b61c209b78b3cf1ac78e2cdc10"
PKG_LICENSE="CC-BY-4.0"
PKG_SITE="https://github.com/libretro/retroarch-assets"
PKG_URL="https://github.com/libretro/retroarch-assets/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="gcc:host"
PKG_LONGDESC="RetroArch assets. Background and icon themes for the menu drivers."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  make -C ${PKG_BUILD} install INSTALLDIR="${INSTALL}/usr/share/retroarch/assets"
}

post_makeinstall_target() {
  # Remove unnecessary files
  for PKG_ASSET_FILES in \
    Automatic branding cfg ctr devtools FlatUX fonts nxrgui README.md scripts Systematic wallpapers
  do
    safe_remove ${INSTALL}/usr/share/retroarch/assets/${PKG_ASSET_FILES}
  done 
}
