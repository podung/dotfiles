#!/bin/zsh

source "$HOME/.profile"

autoload -Uz compinit && compinit

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Turn off the spelling correct.
unsetopt correct_all

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle battery
antigen bundle colorize # ccat syntax highlighting
antigen bundle command-not-found
antigen bundle git
antigen bundle osx # Review these commands: https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/osx
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle asdf

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
# TODO: see what this is and what this affects
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply

# TODO: see if I need this..
# bindkey "^R" history-incremental-search-backward
