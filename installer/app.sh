#!/bin/sh -xu

# 0. Install brew
brew info || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 1. Update brew package index
brew update

# 2. Install filebot package
brew install filebot --force --no-quarantine

# 3. Test Run
filebot -script fn:sysinfo
