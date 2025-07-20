#!/usr/bin/env zsh

# Navigation
setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt globdots

export LS_COLORS="$(vivid generate tokyonight-night)"
type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(starship init zsh)"
  }
eval "$(zoxide init zsh --cmd cd)"
source <(fzf --zsh)


source "${ZDOTDIR}/.zsh_aliases"

# Tool styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'color-scale' all


# Vi mode
bindkey "^r" fzf-history-widget

source "${ZINIT_HOME}/zinit.zsh"

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
zinit snippet OMZP::git
zinit snippet OMZP::brew
zinit snippet OMZP::catimg
zinit snippet OMZP::eza
zinit snippet OMZP::mise
zinit snippet OMZP::command-not-found



autoload -Uz colors && colors
# Load and initialise completion system
autoload -Uz compinit
compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"

zinit cdreplay -q

