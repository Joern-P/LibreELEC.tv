PKG_NAME="dvb-latest"
PKG_VERSION="e0136eadb6f4c24b7f8fcb50ef4d4d5ffb2af31d"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="http://git.linuxtv.org/media_build.git"
PKG_URL="https://git.linuxtv.org/media_build.git"
GET_HANDLER_SUPPORT="git"
PKG_DEPENDS_TARGET="toolchain linux media_tree"
PKG_NEED_UNPACK="$LINUX_DEPENDS $(get_pkg_directory media_tree)"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="DVB drivers from the latest kernel (media_build)"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB drivers from the latest kernel"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  cp -RP $(get_build_dir media_tree)/* ${PKG_BUILD}/linux
  
  # make config all
  kernel_make VER=$KERNEL_VER SRCDIR=$(kernel_path) allyesconfig

  # hack to workaround media_build bug
  if [ "$PROJECT" = Rockchip ]; then
    sed -e 's/CONFIG_DVB_CXD2820R=m/# CONFIG_DVB_CXD2820R is not set/g' -i v4l/.config
    sed -e 's/CONFIG_DVB_LGDT3306A=m/# CONFIG_DVB_LGDT3306A is not set/g' -i v4l/.config
  fi

  # add menuconfig to edit .config
  kernel_make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  install_driver_addon_files "${PKG_BUILD}/v4l/"
}
