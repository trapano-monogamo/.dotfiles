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

setxkbmap -layout "us,us" -variant ",dvp" -option "ctrl:swapcaps" -option "grp:ralt_rshift_toggle"
# keypress repeat rate
xset r rate 200 40

# /home/noemi/battery_message.sh &


if [ "${startwm}" -eq "1" ]; then

	picom -f & # compositor
	nitrogen --restore &
	/usr/bin/start-pulseaudio-x11 &

	exec i3

else

	# GNOME
	# export XDG_SESSION_TYPE=x11
	# export GDK_BACKEND=x11
	# exec gnome-session
	
	# PLASMA
	export DESKTOP_SESSION=plasma
	exec startplasma-x11

fi
