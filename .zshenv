
# XDG
export PRIVATE_DIR="$HOME/.private"
export WORKSPACE="$HOME/.workspace"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"


# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export HISTDUP=eraze

# editor
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat --paging=always"
export MANPAGER='nvim +Man!'
export BROWSER="w3m"


# vi mode
export KEYTIMEOUT=1
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true


# zinit
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


# Tools
export W3M_DIR="$XDG_STATE_HOME/w3m"
export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
FZF_DEFAULT_OPTS=""
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#283457 \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

# Private zone
[ -f "$PRIVATE_DIR/.zsh_private" ] && source "$PRIVATE_DIR/.zsh_private"
