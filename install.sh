#!/bin/bash

# Copyright 2019 Archie Hilton <archie.hilton1@gmail.com>

# This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <https://www.gnu.org/licenses/>.

DWMBAR="/usr/bin/dwmbar"

#if [ "$EUID" -ne 0 ]
#  then echo "Please run as root" > /dev/stderr
#  exit 1
#fi

if [[ ! -f "dwmbar" ]]; then
	echo "dwmbar executable not found." > /dev/stderr
	exit 1
fi

# Create ~/.config/dwmbar
# Containing example bar.sh and modules

DWMBAR_CONF="/home/$USER/.config/dwmbar"

mkdir -pv $DWMBAR_CONF

cp -vrfT "./modules" "$DWMBAR_CONF/modules"

cp -vf "./bar.sh" "$DWMBAR_CONF/bar.sh"

cp -vr "./config" "$DWMBAR_CONF/config"

sudo cp -vf "./dwmbar" $DWMBAR
[[ $? -eq 0 ]] && echo "Installation completed successfully"
