# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="system-tools"
PKG_VERSION="1.0"
PKG_REV="4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of system tools and programs"
PKG_LONGDESC="This bundle currently includes 7-zip, autossh, bottom, diffutils, dool, dtach, efibootmgr, encfs, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, htop, i2c-tools, inotify-tools, jq, libgpiod, lm_sensors, lshw, mc, mmc-utils, mtpfs, nmon, patch, pv, screen, smartmontools, stress-ng, unrar, usb-modeswitch and vim."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="System Tools"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_DEPENDS_TARGET="toolchain \
                    7-zip \
                    autossh \
                    bottom \
                    diffutils \
                    dool \
                    dtach \
                    encfs \
                    evtest \
                    fdupes \
                    file \
                    getscancodes \
                    hddtemp \
                    hd-idle \
                    hid_mapper \
                    htop \
                    i2c-tools \
                    inotify-tools \
                    jq \
                    libgpiod \
                    lm_sensors \
                    lshw \
                    mc \
                    mmc-utils \
                    mtpfs \
                    nmon \
                    patch \
                    pv \
                    screen \
                    sdparm \
                    smartmontools \
                    stress-ng \
                    unrar \
                    usb-modeswitch \
                    vim"


if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" efibootmgr st"
fi

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/{bin,data,lib}

<<<<<<< HEAD
=======
    # 7-zip
    cp -P $(get_install_dir 7-zip)/usr/bin/7zz ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # autossh
    cp -P $(get_install_dir autossh)/usr/bin/autossh ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # bottom
    cp -P $(get_install_dir bottom)/btm ${ADDON_BUILD}/${PKG_ADDON_ID}/bin 2>/dev/null || :

    # diffutils
    cp -P $(get_install_dir diffutils)/usr/bin/{cmp,diff,diff3,sdiff} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # dool
    cp -Pa $(get_install_dir dool)/usr/bin/* ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # dtach
    cp -P $(get_install_dir dtach)/usr/bin/dtach ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # efibootmgr
    cp -P $(get_install_dir efibootmgr)/usr/bin/efibootmgr ${ADDON_BUILD}/${PKG_ADDON_ID}/bin 2>/dev/null || :

    # encfs
    cp -P $(get_install_dir encfs)/usr/bin/{encfs,encfsctl} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # evtest
    cp -P $(get_install_dir evtest)/usr/bin/evtest ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # fdupes
    cp -P $(get_install_dir fdupes)/usr/bin/fdupes ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # file
    cp -P $(get_install_dir file)/usr/bin/file ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir file)/usr/share/misc/magic.mgc ${ADDON_BUILD}/${PKG_ADDON_ID}/data

    # fuse
    cp -P $(get_install_dir fuse)/usr/bin/{fusermount,ulockmgr_server} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir fuse)/usr/sbin/mount.fuse ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir fuse)/usr/lib/{libfuse.so*,libulockmgr.so*} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib

    # getscancodes
    cp -P $(get_install_dir getscancodes)/usr/bin/getscancodes ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
>>>>>>> b6ac306e90136a7b61668f2402ad71d67d05a853

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
