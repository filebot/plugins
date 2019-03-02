#!/bin/sh -xu

# brew requires Command Line Tools for Xcode
xcode-select --print-path || sudo xcode-select --install

# install brew if necessary
brew info || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# update brew package index and update all packages
brew update && brew upgrade

# install FileBot bundle
brew cask install filebot --force
