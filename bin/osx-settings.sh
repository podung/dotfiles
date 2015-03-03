#!/bin/bash

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Set magnification on for dock
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 56

# Enable tap to click (Trackpad) for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Show all files
defaults write com.apple.finder AppleShowAllFiles TRUE

# Show ~/Library
chflags nohidden ~/Library
