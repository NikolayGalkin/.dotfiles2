#!/usr/bin/env zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$($HOME/.local/bin/mise activate zsh)"

# eval "$(zoxide init zsh --cmd cd)"
# source <(fzf --zsh)

# zinit 
# if [ ! -d "$ZINIT_HOME" ]; then
#   mkdir -p "$(dirname $ZINIT_HOME)"
#   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# fi
