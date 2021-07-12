# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
XDG_CONFIG_HOME="$HOME/.config"
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then 
	export MOZ_ENABLE_WAYLAND=1
    export GTK_THEME=Adwaita:dark
	export XDG_CURRENT_DESKTOP=sway
    export TERM=alacritty
    export TERMINAL="alacritty -e"
    export EDITOR=nvim
	export XDG_SESSION_TYPE=wayland
	exec sway 
fi
