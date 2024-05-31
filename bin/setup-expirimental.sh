source $(dirname $0)/helpers.sh

has_brew
has_stow

# update brew itself
fancy_echo "updating brew...."
brew update

# Examples
#   brew_install_or_upgrade 'curl'
#   cask_install 'google-chrome'

cask_install 'finicky'
