#Functions

#function fish_user_key_bindings
#  fish_vi_key_bindings
#end
# Bindings

bind ` accept-autosuggestion

#Exports
export EDITOR="nvim"   
export SHELL="/usr/bin/fish"
export PDFVIEWER='zathura'
export GROFF_NO_SGR='1'
set -x MANPAGER '/bin/bash -c "nvim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'


#Aliases

alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias todo="task minimal"

alias ..="cd .."
alias ...="cd ../.."

alias rotateback="xrandr --output eDP-1 --rotate normal"	
alias wifi="nmcli c"
alias wificon="nmcli device wifi connect"
alias spicetify="~/spicetify-cli/spicetify"


alias changekey="setxkbmap -layout"
alias vim="nvim"
alias brc="vim ~/.bashrc"
alias frc="vim ~/.config/fish/config.fish"
alias vrc="vim ~/.vimrc"
alias nvrc="cd ~/.config/nvim && vim"
alias drc="vim ~/.config/dunst/dunstrc"
alias i3conf="vim ~/.config/i3/config"
alias swayconf="vim ~/.config/sway/config"
alias alaconf="vim ~/.config/alacritty/alacritty.yml"
alias polyconf="vim ~/.config/polybar/config"
alias pconf="vim ~/.config/picom/picom.conf"
alias zrc="vim ~/.config/zathura/zathurarc"
alias py3="python3"
alias mtex="nvim /home/fcomoreira/texmf/tex/latex/local/moreira.sty"
alias vw="vim -c VimwikiIndex"
alias wiki="vw"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias lazyconfig='lazygit --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias wayconf="vim ~/.config/waybar/"
alias ytdl='youtube-dl -f best -o "%(title)s.%(ext)s"'
