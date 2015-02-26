#!/bin/bash
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install caskroom/cask/brew-cask
brew tap caskroom/fonts 

brew cask update

brew cask install font-source-code-pro

caskapps=(
adium
avast
google-chrome
google-drive
box-sync
vlc
virtualbox
vagrant
vagrant-bar
flux
appcleaner
yed
lastpass
sourcetree
nosleep
gpgtools
)

echo "install brew apps"
brew install vim --with-lua
brew install macvim --custom-icons --override-system-vim --with-lua --with-luajit
brew install mackup

echo "installing cask apps..."
brew cask install --appdir="/Applications" ${caskapps[@]}
vagrant plugin install vagrant-vbguest

echo "install yadr"
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"

echo "configure zsh"
cp -v zsh.after/* ~/.zsh.after
cp -v zsh.prompts/* ~/.zsh.prompts

echo "configuring vim"
cp vim.after ~/.vim.after
cp vundles.local ~/.vim/.vundles.local
vim +PluginInstall +qall

echo "configure lastpass"
open   '/opt/homebrew-cask/Caskroom/lastpass/latest/LastPass Installer.app'

echo "configure sshkeys"
open '/Applications/Google Drive.app'
echo ""

while [ ! -f "~/Google Drive/keys/id_rsa"]; do
  cd ~/Google\ Drive
  cd keys
  ./ssh_setup.sh
done

brew cleanup
