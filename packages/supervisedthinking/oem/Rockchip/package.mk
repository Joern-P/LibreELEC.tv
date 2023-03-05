# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="Rockchip"
PKG_VERSION="1.0.9"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://bit.ly/3vL5rH3"
PKG_DEPENDS_TARGET="toolchain retroarch emulationstation flycast mupen64plus-nx vice-libretro snes9x scummvm mame2010 pcsx_rearmed ppsspp dolphin dosbox-staging moonlight-qt amiberry raze rr-config-tool"
PKG_LONGDESC="Metapackage for various LibreELEC-RR OEM packages"
PKG_TOOLCHAIN="manual"
 


################################################################################
# Setup packages included in Rockchip images
################################################################################


################################################################################
# Install OEM packages to LibreELEC-RR
################################################################################


makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}

  # Install OEM config files & scripts
  cp -PRv ${PKG_DIR}/config/* ${INSTALL}
}
