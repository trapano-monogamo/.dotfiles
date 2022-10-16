#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi




# ~ PERSONAL STUFF ~


# status bar:
# 	1. dwmblocks
# 	2. dwmstatus
#	3. my custom status bar (xsetroot)
# 	4. dwm-bar
# dwmstatus 2>&1 >/dev/null &
# ./mstatus.sh 2>&1 >/dev/null &
# dwmblocks 2>&1 >/dev/null &
# ./suckless/dwm-bar/dwm_bar.sh &

# i3 blocks

#setxkbmap -layout us -option ctrl:nocaps &
#setxkbmap -layout us -option shift_caps_toggle:caps_toggle &
# setxkbmap -layout us -option ctrl:swapcaps
setxkbmap -layout "us,us" -variant ",dvp" -option "ctrl:swapcaps" -option "grp:ralt_rshift_toggle"

xset r rate 200 40

# compositor
picom -f &

# wallpaper
nitrogen --restore &

# audio
/usr/bin/start-pulseaudio-x11 &

# dwm >/dev/null 2>&1
# i3 >/dev/null 2>&1

/home/noemi/battery_message.sh &

# exec dwm
exec i3
