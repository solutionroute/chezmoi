#!/bin/bash
# dwl startup file

# wayland doesn't use startx or .xinitrc/xprofile, so we'll call this manually
# from a login prompt or from dwl.desktop launched by gdm.

HOSTNAME=`uname -n`
export OS_RELEASE=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"' | tr '[:upper:]' '[:lower:]')
export XDG_CURRENT_DESKTOP="X-Generic"

case "$OS_RELEASE" in
    void )
        # pipewire is not started as a service on void; is on arch
        pipewire &
        pipewire-pulse &
        ;;
    arch )
        ;;
esac

case "$HOSTNAME" in
    wabbit ) 
        # allow alacritty to scale similarly to laptop
        # export WINIT_X11_SCALE_FACTOR="1.5";
        # selects DisplayPort-1 input on rh display
        sudo ddcutil -d 2 setvcp 60 0x0f;
        redshift &
        # colour temp of screen
    # lapin ) ;; 
    # pika ) ;; 
    # hoppy ) ;;
esac

# naturally
export XKB_DEFAULT_OPTIONS="ctrl:nocaps"

# init keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# export keyring globals
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

dbus-run-session dwl -s 'somebar && wbg /home/mw/src/dotfiles/wallpaper/darkblue-left.jpg <&-'

