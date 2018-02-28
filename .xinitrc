#!/bin/sh
# won't be used with lightdm / xsession
# here for trouble shooting if a DM isn't installed
# xrdb -merge ~/.Xresources
exec dwm
