HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS
setopt autocd nomatch notify
unsetopt beep
bindkey -v

#########################################
# Completion
#########################################

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle :compinstall filename '/home/fcomoreira/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
zmodload -i zsh/complist

autoload -Uz vcs_info
precmd() { vcs_info }

# setopt PROMPT_SUBST
# # NEWLINE=$'\n'
# NEWLINE=''
# PROMPT="%B%F{green}%*%f %F{blue}%2~%f> %b${NEWLINE}"

#########################################
# Plugins
#########################################
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

#########################################
# Keybindings
#########################################

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey '^F' autosuggest-accept
bindkey '^ ' autosuggest-accept
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -v
bindkey "^R" history-incremental-pattern-search-backward

# Simulating Fish's incremental searching with arrows
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${ZDOTDIR}/.zcompdump"
fi


#########################################
# Window Name
#########################################

# Write some info to terminal title.
# This is seen when the shell prompts for input.
function precmd {
  print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
}
# Write command and args to terminal title.
# This is seen while the shell waits for a command to complete.
function preexec {
  printf "\033]0;%s\a" "$1"
}

#########################################
# Aliases
#########################################

alias py3="python3"

source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# opam configuration
[[ ! -r /home/fcomoreira/.opam/opam-init/init.zsh ]] || source /home/fcomoreira/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# if [[ -z "${CONDA_SHLVL}" ]]; then
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/fcomoreira/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
  # if [ 1 -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/fcomoreira/miniconda3/etc/profile.d/conda.sh" ]; then
# . "/home/fcomoreira/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
      else
# export PATH="/home/fcomoreira/miniconda3/bin:$PATH"  # commented out by conda initialize
      fi
  fi
  unset __conda_setup
# <<< conda initialize <<<
# fi


#########################################
# Prompt
#########################################
eval "$(starship init zsh)"
