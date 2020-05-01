#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install openssl

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap

# Install other useful binaries.
brew install the_silver_searcher
brew install git-lfs
brew install gs
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# brew cask
brew tap caskroom/cask

brew cask install zoomus

brew cask install keepassxc

brew cask install sublime-text

brew cask install private-internet-access

brew cask install android-platform-tools

brew cask install android-studio

brew cask install pycharm-ce

brew cask install intellij-idea-ce

brew cask install virtualbox

brew cask install firefox

brew cask install google-chrome

brew cask install skim

brew cask install vlc

brew cask install reaper

brew cask install spotify

brew cask install signal

brew cask install discord

brew cask install slack

brew cask install flux

brew cask install steveschow-gfxcardstatus

brew cask install eve

brew cask install google-backup-and-sync

brew cask install istat-menus

brew cask install the-unarchiver

brew install scala
brew install maven
brew install gradle
brew install pipenv

# Remove outdated versions from the cellar.
brew cleanup

# Install Google Fonts
git clone https://github.com/google/fonts.git ~/Library/Fonts/google-fonts

# Install haskell (GHC)
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
