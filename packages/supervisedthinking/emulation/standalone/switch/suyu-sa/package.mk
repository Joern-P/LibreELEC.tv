# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2022-present JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="suyu-sa"
PKG_VERSION="ee365bad9501c73ff49936e72ec91cd9c3ce5c24"
PKG_ARCH="x86_64 aarch64"
PKG_LICENSE="GPLv3"
PKG_SITE="https://git.suyu.dev/suyu/suyu"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain libfmt boost ffmpeg zstd zlib libzip lz4 opus libusb nlohmann-json vulkan-headers vulkan-loader" # qt5
PKG_SHORTDESC="Nintendo Switch emulator"
PKG_TOOLCHAIN="cmake"
GET_HANDLER_SUPPORT="git"

if [ ! "${OPENGL}" = "no" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGL} glu libglvnd"
  PKG_CONFIGURE_OPTS_TARGET+=" -DENABLE_X11=OFF"
fi

if [ "${OPENGLES_SUPPORT}" = yes ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
fi

if [ "${DISPLAYSERVER}" = "wl" ]; then
  PKG_DEPENDS_TARGET+=" wayland ${WINDOWMANAGER} xwayland xrandr libXi"
fi

if [ "${VULKAN_SUPPORT}" = "yes" ]
then
  PKG_DEPENDS_TARGET+=" vulkan-loader vulkan-headers"
fi

PKG_CMAKE_OPTS_TARGET+="        -DENABLE_QT=OFF \
                                -DCMAKE_BUILD_TYPE=Release \
                                -DSUYU_USE_BUNDLED_SDL2=ON \
                                -DSUYU_USE_BUNDLED_QT=OFF \
                                -DSUYU_TESTS=OFF \
                                -DENABLE_SDL2=ON \
                                -DARCHITECTURE_x86_64=OFF \
                                -DARCHITECTURE_arm64=ON \
                                -DBUILD_SHARED_LIBS=OFF \
				-DENABLE_WEB_SERVICE=OFF \
				-DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
				-DSUYU_USE_BUNDLED_FFMPEG=OFF \
				-DSUYU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
				-DSUYU_USE_EXTERNAL_SDL2=OFF \
				-DSUYU_USE_FASTER_LD=OFF \
				-DSUYU_USE_PRECOMPILED_HEADERS=OFF \
				-DSUYU_USE_QT_MULTIMEDIA=OFF \
				-DSUYU_USE_QT_WEB_ENGINE=OFF \
                                -DUSE_DISCORD_PRESENCE=OFF"
pre_configure_target() {
  CFLAGS=$(echo ${CFLAGS} | sed -e "s|-Ofast|-O3|")
  CXXFLAGS=$(echo ${CXXFLAGS} | sed -e "s|-Ofast|-O3|")
  export LDFLAGS="-L${TOOLCHAIN}/lib/"
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed  -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp -rf ${PKG_BUILD}/.${TARGET_NAME}/bin/suyu* ${INSTALL}/usr/bin
  cp -rf ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin

  chmod +x ${INSTALL}/usr/bin/start_suyu.sh

  mkdir -p ${INSTALL}/usr/config/suzu
  cp -rf ${PKG_DIR}/config/* ${INSTALL}/usr/config/suyu
}
