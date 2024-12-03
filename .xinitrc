#!/bin/sh

/etc/X11/xinit/xinitrc

# GNOME Keyring stuff
dbus-update-activation-environment --all
/usr/bin/gnome-keyring-daemon --start --components=secrets

# Desktop Manager Stuff
exec bspwm
