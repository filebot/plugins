#!/bin/sh -xu

# 0a. Install Command Line Tools for Xcode (if necessary)
xcode-select --print-path || sudo xcode-select --install

# 0b. Install brew cask (if necessary)
brew info || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 1. Update brew package index and upgrade all packages to the latest release
brew update && brew upgrade

# 2. Install filebot package
brew cask install filebot --force --no-quarantine

# 3. Test Run
filebot -script fn:sysinfo
