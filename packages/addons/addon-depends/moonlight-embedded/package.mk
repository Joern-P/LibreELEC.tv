# SPDX-License-Identifier: GPL-3.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="moonlight-embedded"
PKG_VERSION="4c58ac9f3923c11ff75620dacf7c79317de456cf"
PKG_SHA256="94a2f5677ceb0bc535cd9767f3e21bfaa161d82a960b749c0e1f4fa50275ef49"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/moonlight-stream/moonlight-embedded"
PKG_URL="https://github.com/moonlight-stream/moonlight-embedded/archive/${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="moonlight-stream"
PKG_DEPENDS_TARGET="toolchain curl pulseaudio systemd alsa-lib moonlight-common-c libevdev sdlgamecontrollerdb enet opus-system"
PKG_SECTION=""
PKG_SHORTDESC="Open source NVIDIA GameStream Linux client"
PKG_LONGDESC="Moonlight Embedded is an open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield, but built for Linux."
PKG_CMAKE_OPTS_TARGET="-DENABLE_SOFTWARE=OFF -DENABLE_CEC=OFF"

pre_build_target() {
  cp -a $(get_build_dir moonlight-common-c)/* ${PKG_BUILD}/third_party/moonlight-common-c
  cp -a $(get_build_dir sdlgamecontrollerdb)/* ${PKG_BUILD}/third_party/SDL_GameControllerDB
  cp -a $(get_build_dir enet)/* ${PKG_BUILD}/third_party/moonlight-common-c/enet
}

