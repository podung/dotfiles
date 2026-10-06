#!/bin/zsh

# Turn off the spelling correct.
unsetopt correct_all

# Homebrew completions and functions (pure, gh, etc.) — must be on fpath before compinit.
# HOMEBREW_PREFIX comes from `brew shellenv` in ~/.zprofile (login shells); cover non-login shells too.
[[ -n "$HOMEBREW_PREFIX" ]] || eval "$(/opt/homebrew/bin/brew shellenv)"
fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")
fpath+=("$HOME/.docker/completions")   # Docker Desktop CLI completions

# Plugins (see ~/.zsh_plugins.txt)
source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"
antidote load

# Shared env, PATH, and aliases
source "$HOME/.profile"

# Tool versions (node, dotnet, ...) — see ~/.config/mise/config.toml
eval "$(mise activate zsh)"

# fzf: Ctrl-R history, Ctrl-T files, Alt-C cd
source <(fzf --zsh)

# zoxide: `z <partial dir>`
eval "$(zoxide init zsh)"

# Up/down search history for what's already typed
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

setopt nosharehistory

# Prompt
autoload -U promptinit; promptinit
prompt pure
