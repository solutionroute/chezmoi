#!/bin/sh
virsh start windows
/home/mw/bin/gnome-randr.py --output DP-2 --off
# /home/mw/bin/gnome-randr.py --output DP-2 --auto --right-of HDMI-1
