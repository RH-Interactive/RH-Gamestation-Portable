#!/bin/bash

export XDG_MENU_PREFIX=gamestation-
export XDG_CONFIG_DIRS=/etc/xdg

DISPLAY=:0.0 matchbox-remote -s # show the mouse
DISPLAY=:0.0 pcmanfm /gamestation/share
DISPLAY=:0.0 matchbox-remote -h # hide the mouse
