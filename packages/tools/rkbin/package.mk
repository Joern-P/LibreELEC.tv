# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="rkbin"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/rockchip-linux/rkbin"
PKG_LONGDESC="rkbin: Rockchip Firmware and Tool Binaries"
PKG_TOOLCHAIN="manual"
PKG_PATCH_DIRS+="${DEVICE}*"
GET_HANDLER_SUPPORT="git"

PKG_VERSION="f02d10e468d8c783c45137d230ff33d42ca670b4"
PKG_URL="${PKG_SITE}.git"
