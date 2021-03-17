# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="oem"
PKG_VERSION=""
PKG_LICENSE="various"
PKG_SITE="http://www.libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain emulationstation retroarch flycast mame2010 dosbox-staging snes9x2010 mupen64plus-nx libretro-vice rr-config-tool amiberry duckstation"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"
PKG_TOOLCHAIN="manual"

# Entware support
if [ "$ENTWARE_SUPPORT" = "yes" ]; then
  ln -sf /storage/.opt $INSTALL/opt
  PKG_DEPENDS_TARGET+=" entware"
fi


makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}

  # Install OEM config files & scripts
  cp -PRv ${PKG_DIR}/common/*     ${INSTALL}
  cp -PRv ${PKG_DIR}/${PROJECT}/* ${INSTALL}
}
