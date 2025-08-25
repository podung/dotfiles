#!/bin/zsh

# Turn off the spelling correct.
unsetopt correct_all

source ~/.antigen/antigen.zsh

# Needed for brew installed Pure prompt
# https://github.com/sindresorhus/pure?tab=readme-ov-file#homebrew
# If you're not using ZSH from Homebrew (brew install zsh and $(brew --prefix)/bin/zsh), you must also add the site-functions to your fpath in $HOME/.zshrc:
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Load the oh-my-zsh's library.
antigen use ohmyzsh/ohmyzsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle battery
antigen bundle colorize # ccat syntax highlighting
antigen bundle command-not-found
antigen bundle git
antigen bundle macos # Review these commands: https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/osx
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle asdf

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen bundle zsh-users/zsh-history-substring-search

antigen bundle mafredri/zsh-async

# NOTE: this antigen is failing to git clone, so I'm `brew install pure`
# antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply

source "$HOME/.profile"

setopt nosharehistory
bindkey "^R" history-incremental-search-backward

# Forcing asdf to be at head of path
export PATH="$ASDF_DATA_DIR/shims:$PATH"

