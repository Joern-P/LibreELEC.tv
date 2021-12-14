# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="Rockchip"
PKG_VERSION="1.0.0"
PKG_LICENSE="GPL-2.0-or-later"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Metapackage for various OEM packages"
PKG_TOOLCHAIN="manual"

################################################################################
# Setup packages included in Rockchip images
################################################################################

# Libretro cores 
OEM_EMULATORS_LIBRETRO_ROCKCHIP=" \
  retroarch \
  dosbox-pure \
  flycast \
  mame2003-plus \
  mupen64plus-nx \
  pcsx_rearmed \
  snes9x \
  vice-libretro"
 
# Standalone emulators
OEM_EMULATORS_STANDALONE_ROCKCHIP=" \
  emulationstation \
  amiberry \
  dosbox-staging"
 
# Tools
OEM_TOOLS_ROCKCHIP=" \
  rr-config-tool"


################################################################################
# Install OEM packages to LibreELEC-RR
################################################################################

configure_package() {
  if [ "${OEM_SUPPORT}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_STANDALONE_ROCKCHIP}"
      PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_LIBRETRO_ROCKCHIP}"
      PKG_DEPENDS_TARGET+=" ${OEM_TOOLS_ROCKCHIP}"
  fi
}

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}

  # Install OEM config files & scripts
  cp -PRv ${PKG_DIR}/config/* ${INSTALL}
}
