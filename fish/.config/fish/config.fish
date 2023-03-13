#Functions

#function fish_user_key_bindings
#  fish_vi_key_bindings
#end
# Bindings

#Exports
export EDITOR="nvim"   
export SHELL="/usr/bin/fish"
export GOOGLE_APPLICATION_CREDENTIALS="/home/fcomoreira/.config/gspread/auth.json"
export PDFVIEWER='zathura'
export GROFF_NO_SGR='1'
#set -x MANPAGER '/bin/bash -c "nvim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'


#Aliases

alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias ..="cd .."
alias ...="cd ../.."

alias wifi="nmcli c"
alias wificon="nmcli device wifi connect"

alias vim="nvim"
alias nvrc="cd ~/.config/nvim && vim"
alias py3="python3"
alias mtex="nvim /home/fcomoreira/texmf/tex/latex/local/moreira.sty"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias lazyconfig='lazygit --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias ytdl='youtube-dl -f best -o "%(title)s.%(ext)s"'

# opam configuration
source /home/fcomoreira/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
