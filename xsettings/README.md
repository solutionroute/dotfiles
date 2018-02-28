# xsettings 

## Why

I run a simple tiling window manager, no Gnome or desktop environments, and
needed a way to change DPI on the fly when moving my VirtualBox Linux guest OS
from my HiDPI laptop to one of my standard DPI monitors in the office.

The script will resize gtk3 applications like Gnome-Terminal and Google
Chrome... these are about the only GUIs running on my system.

## Installation

	sudo apt-get install xsettingsd
	touch ~/.xsettingsd

Edit your .xsessionrc to include:

	xsettingsd &

Run the script. 

I may wrap my terminal launcher and this script into one... always opening
terminals so changing DPI is as easy as opening a new window.
