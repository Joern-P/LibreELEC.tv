# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="system-tools"
PKG_VERSION="1.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of system tools and programs"
PKG_LONGDESC="This bundle currently includes 7-zip, autossh, bottom, diffutils, dstat, dtach, efibootmgr, encfs, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, htop, i2c-tools, inotify-tools, jq, libgpiod, lm_sensors, lshw, mc, mmc-utils, mtpfs, nmon, patch, pv, screen, smartmontools, stress-ng, unrar, usb-modeswitch and vim."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="System Tools"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_DEPENDS_TARGET="toolchain \
                    hddtemp \
                    hd-idle \
                    hid_mapper \
                    htop \
                    mc \
                    mmc-utils \
                    screen"


if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" efibootmgr st"
fi

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/{bin,data,lib}


    # hddtemp
    cp -P $(get_install_dir hddtemp)/usr/sbin/hddtemp ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir hddtemp)/usr/share/misc/hddtemp.db ${ADDON_BUILD}/${PKG_ADDON_ID}/data

    # hd-idle
    cp -P $(get_install_dir hd-idle)/usr/sbin/hd-idle ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # hid_mapper
    cp -P $(get_install_dir hid_mapper)/usr/bin/hid_mapper ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # htop
    cp -P $(get_install_dir htop)/usr/bin/htop ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

       # mc
    cp -Pa $(get_install_dir mc)/usr/bin/* ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/
    cp -Pa $(get_install_dir mc)/storage/.kodi/addons/virtual.system-tools/* ${ADDON_BUILD}/${PKG_ADDON_ID}

    # mmc-utils
    cp -P $(get_install_dir mmc-utils)/usr/local/bin/mmc ${ADDON_BUILD}/${PKG_ADDON_ID}/bin


    # screen
    cp -L $(get_install_dir screen)/usr/bin/screen ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    
}
