# Core Brewfile — `brew bundle --file=~/dotfiles/Brewfile`
#
# What goes where:
#   * GUI apps that update themselves  -> cask here (brew only does the first install)
#   * CLIs with a self-updating native installer (Claude Code) -> NOT here, see bin/install
#   * everything else                  -> formula here, updated with `brew upgrade`
#
# Optional groups can live in Brewfile.<group>: `brew bundle --file=Brewfile.<group>`

# Shell
brew "antidote"
brew "pure"
brew "fzf"
brew "zoxide"
brew "mise"

# Core CLI
brew "git"
brew "git-delta"
brew "gh"
brew "tig"
brew "vim"
brew "stow"
brew "ripgrep"
brew "bat"
brew "eza"
brew "jq"
brew "coreutils"
brew "findutils"
brew "watch"
brew "htop"
brew "nmap"
brew "mas"     # Mac App Store CLI, for the `mas` entries below

# tmux
brew "tmux"
brew "tmuxinator"

# AI tools (Claude Code is installed natively by bin/install so it self-updates)
cask "codex"

# Apps
cask "ghostty"
cask "slack"
cask "google-chrome"
cask "firefox"
cask "1password"
cask "1password-cli"
cask "visual-studio-code"
cask "rectangle"
cask "thaw@beta" # menu bar manager; beta = 3.0 rewrite, the only macOS 27 build. Switch to "thaw" once 3.0 is stable
cask "docker-desktop"  # paid subscription required at larger companies

# Displays
cask "betterdisplay"
cask "ddpm"     # Dell Display and Peripheral Manager

# Fonts
cask "font-source-code-pro"

# Mac App Store (must be signed in to the App Store; installs apps you already own)
mas "Things 3", id: 904280696
