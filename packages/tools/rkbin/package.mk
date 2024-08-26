# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rkbin"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
#PKG_SITE="https://github.com/rockchip-linux/rkbin"
PKG_SITE="https://github.com/Kwiboo/rkbin-2"
PKG_LONGDESC="rkbin: Rockchip Firmware and Tool Binaries"
PKG_TOOLCHAIN="manual"
PKG_PATCH_DIRS+="${DEVICE}*"
GET_HANDLER_SUPPORT="git"
#PKG_VERSION="f02d10e468d8c783c45137d230ff33d42ca670b4"
PKG_VERSION="ae3631e6eac16ee97c74aa9bfc1e9904c0d66e86"
PKG_URL="${PKG_SITE}.git"
