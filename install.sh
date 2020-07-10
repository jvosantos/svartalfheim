#!/usr/bin/env bash

set -e
set -o pipefail

# create soft links
ln -s $(pwd)/dot_Brewfile ~/.Brewfile
ln -s $(pwd)/dot_Brewfile.lock.json ~/.Brewfile.lock.json
ln -s $(pwd)/dot_config ~/.config
ln -s $(pwd)/dot_resources ~/.resources
ln -s $(pwd)/dot_gitignore ~/.gitignore
ln -s $(pwd)/dot_gitconfig ~/.gitconfig
ln -s $(pwd)/dot_vim ~/.vim
ln -s $(pwd)/dot_vimrc ~/.vimrc
ln -s $(pwd)/dot_vim_runtime ~/.vim_runtime

# Install xcode
if ! [ $(xcode-select -p) ]; then
    xcode-select --install
fi

# Install homebrew and brew bundle
if ! [ $(which brew) ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew upgrade
    brew bundle --global
fi

# install material design colors on iterm
open "dot_resources/itermcolors/material-design-colors.itermcolors"
# install nerd font on system
open -W "dot_resources/nerd_font.ttf"

# make fish default shell
echo "$(command -v fish)" | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"

# Post install notes
echo "Apply color preset"
echo " - Open iTerm -> Preferences -> Profiles -> Colors -> Presets and apply color preset"
echo "Apply nerd font"
echo " - Open iTerm -> Preferences -> Profiles -> Text -> Font and apply font (for non-ASCII as well)"

