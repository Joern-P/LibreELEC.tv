# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="NetCore"
PKG_REV="0"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain icu aspnet6-runtime"
PKG_SECTION="tools"
PKG_SHORTDESC="ASP.NET Core Runtime"
PKG_LONGDESC="ASP.NET Core Runtime ($(get_pkg_version aspnet6-runtime)) enables you to run existing console/web/server applications."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp -r $(get_build_dir aspnet6-runtime)/*  ${INSTALL}/usr/bin/
  chmod 0755 ${INSTALL}/usr/bin/*
  
  #mkdir -p ${INSTALL}/usr/lib
  #cp -L $(get_install_dir icu)/usr/lib/lib*.so.?? ${INSTALL}/usr/lib/
}


