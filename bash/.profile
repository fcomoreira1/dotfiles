# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
# set PATH so it includes user's private bin if it exists
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export EDITOR="nvim"
export VISUAL="nvim"
export WINEPREFIX="$HOME/.wine winetricks dotnet45 win10"
export PATH="$HOME/.local/bin:$PATH"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export LIBVA_DRIVER_NAME=iHD

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/projects/lua-language-server/bin/:$PATH:$HOME/projects/ltex-ls/bin/"
fi
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then 
  export GTK_THEME="Catppuccin-Mocha-Standard-Blue-Dark"
  export XDG_SESSION_TYPE=wayland
  export MOZ_ENABLE_WAYLAND=1
	export XDG_CURRENT_DESKTOP=sway
	exec startsway
fi

alias luamake=/home/fcomoreira/projects/lua-language-server/3rd/luamake/luamake
