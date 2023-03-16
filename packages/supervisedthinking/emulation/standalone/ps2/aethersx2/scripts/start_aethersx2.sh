#!/bin/bash

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2023-present BrooksyTech (https://github.com/brooksytech)

. /etc/profile

export PAN_MESA_DEBUG=gl3,gofaster

#Check if aethersx2 exists in .config
if [ ! -d "/storage/.config/aethersx2" ]; then
    mkdir -p "/storage/.config/aethersx2"
        cp -r "/usr/config/aethersx2" "/storage/.config/"
fi

#Make Aethersx2 bios folder
if [ ! -d "/var/media/SSD/roms/bios/aethersx2" ]; then
    mkdir -p "/var/media/SSD/roms/bios/aethersx2"
fi

#Create PS2 savestates folder
if [ ! -d "/var/media/SSD/roms/savestates/ps2" ]; then
    mkdir -p "/var/media/SSD/roms/savestastes/ps2"
fi

# Set Qt5 screen scale environment vars
set_QT_environment_vars

@APPIMAGE@ -fullscreen "${1}"
