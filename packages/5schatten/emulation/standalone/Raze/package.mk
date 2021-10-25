# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="Raze"
PKG_VERSION="61ba58c529f3132da00da918f2970df68c02b950" 
PKG_SHA256=""
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/coelckers/Raze"
PKG_URL="https://github.com/coelckers/Raze/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain ZMusic Raze:host"
PKG_DEPENDS_HOST="toolchain ZMusic:host"
PKG_LONGDESC="Blood port based on EDuke32"
PKG_CMAKE_OPTS_HOST="-DNO_OPENMP=ON  -DNO_FMOD=ON -UFMOD_LIBRARY -UFMOD_INCLUDE_DIR -DNO_GTK=ON -DNO_OPENAL=ON -DCMAKE_BUILD_TYPE=Release"

PKG_CMAKE_OPTS_TARGET="-DNO_OPENMP=ON  -DNO_FMOD=ON -UFMOD_LIBRARY -UFMOD_INCLUDE_DIR -DNO_GTK=ON -DNO_OPENAL=ON -DCMAKE_BUILD_TYPE=Release \
    			-DIMPORT_EXECUTABLES=${PKG_BUILD}/.${HOST_NAME}/ImportExecutables.cmake"

