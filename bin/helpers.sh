fancy_echo() {
  local fmt="$1"; shift

  printf "\n$fmt\n" "$@"
}

has_brew() {
  if [ ! -f "$(which brew)" ]; then
    echo 'Please install brew.'
    echo '  See http://brew.sh'
    echo ''
    echo '  To install:'
    echo '  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    exit 1
  fi
  return 0
}

has_stow() {
  if [ ! -f "$(which stow)" ]; then
    echo 'Please install stow.'
    echo '  See http://www.gnu.org/software/stow/'
    echo ''
    echo '  To install:'
    echo '  brew install stow'
    exit 1
  fi
  return 0
}

cask_install() {
  if cask_is_installed "$1"; then
    fancy_echo "Cask '$1' is already installed... no easy way to upgrade yet."
  else
    brew install --cask "$1"
  fi
}

cask_is_installed() {
  local name="$(brew_cask_expand_alias "$1")"

  brew list --cask -1 | grep -Fqx "$1"
}

brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$1"
}

brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$1" >/dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_expand_alias() {
  brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_tap() {
  brew tap "$1" 2> /dev/null
}

stow_it() {
  stow --verbose files || echo 'Unable to stow ./files directory.'
  stow --verbose secret_files || echo 'Unable to stow ./secret_files directory.'
}

setup_vim() {
  [ ! -d $HOME/.vim/bundle/vundle ] && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
  vim +PluginInstall +qall
}

setup_zsh(){
  if [ ! -d $HOME/.antigen ]; then
    git clone https://github.com/zsh-users/antigen.git $HOME/.antigen
  fi

  echo "Changing default shell to zsh"
  sudo sh -c "echo $(which zsh) >> /etc/shells"
  chsh -s $(which zsh)
}

install_asdf(){
  if [ ! -d $HOME/.asdf ]; then
    fancy_echo "Installing asdf"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  fi
}
