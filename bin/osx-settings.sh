#!/bin/bash
#
# macOS preferences. Safe to re-run. Some settings (key repeat, trackpad)
# only take effect after logging out and back in.

###############################################################################
# Dock
###############################################################################

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Set magnification on for dock
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 56

# Lower left hot corner shows the desktop (no modifier key)
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0

###############################################################################
# Menu bar
###############################################################################

# Show battery percentage
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

###############################################################################
# Keyboard & trackpad
###############################################################################

# Fast key repeat (lower is faster; System Settings minimums are 2 and 15)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Key repeat instead of the accent popup in VS Code (vim mode)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Tap to click: built-in trackpad, Bluetooth trackpad, and the login screen
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

###############################################################################
# Finder
###############################################################################

# Show hidden files, all file extensions, path bar, and status bar
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Show ~/Library
chflags nohidden ~/Library

# Don't write .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# Screenshots
###############################################################################

mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"

###############################################################################
# Apply
###############################################################################

killall Dock Finder SystemUIServer 2>/dev/null || true

echo "Done. Log out and back in for key repeat and trackpad changes."
