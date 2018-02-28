#!/bin/sh
# Resets GTK Xft/DPI setting
# Requires xsettingsd (in Debian packages):
#	At least a default ~/.xsettingsd
#	In .xsessionrc:
#		xsettingsd &
#       reset-dpi.sh
# or run this script right after startup
#DIM=`xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $3"x"$4}'`
DIM=`xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $3}'`
echo $DIM
# my desktop monitors
if [ $DIM  -lt "2000" ]
then
	echo "Setting std dpi"
	cp ~/dotfiles/xsettings/.xsettingsd-stddpi ~/.xsettingsd
else
	echo "Setting hi dpi"
	cp ~/dotfiles/xsettings/.xsettingsd-hidpi  ~/.xsettingsd
fi
# forces server to reload
killall -HUP xsettingsd
