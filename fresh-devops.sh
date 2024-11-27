#!/bin/sh

echo "Setting up your Mac..."

# Install git first
brew install git

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Set up MySQL
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions
pecl install imagick memcached redis swoole

# Install and configure Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose
$HOME/.composer/vendor/bin/valet install

# Set up directory structure
# mkdir -p $HOME/Sites/{perso,training,pro}

# Set up dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Clone repositories if needed
# ./clone.sh

# Configure macOS preferences
source .macos

# Taps
brew tap 'homebrew/bundle'
brew tap 'homebrew/cask-fonts'
brew tap 'homebrew/cask-versions'
brew tap 'nicoverbruggen/homebrew-cask'

# Binaries
brew install 'awscli'
brew install 'bash'
brew install 'coreutils'
brew install 'ffmpeg'
brew install 'gh'
brew install 'git'
brew install 'gnupg'
brew install 'grep'
brew install 'httpie'
brew install 'mackup'
brew install 'mas'
brew install 'pkg-config'
brew install 'svn'
brew install 'trash'
brew install 'tree'
brew install 'jq' # JSON processor
brew install 'bat' # Better cat
brew install 'fzf' # Fuzzy finder
brew install 'ripgrep' # Better grep

# Development
brew install 'php'
brew install 'composer'
brew install 'mysql'
brew install 'nginx'
brew install 'node'
brew install 'redis'
brew install 'yarn'
brew install 'pnpm'
brew install 'vite'
brew install 'hadolint'
brew install 'meilisearch'
brew install 'stripe/stripe-cli/stripe'
brew install 'act' # Run GitHub Actions locally
brew install 'lazygit' # Terminal UI for git
brew install 'watchman' # File watching service

# Apps
brew install --cask 'dbngin'
brew install --cask 'docker'
brew install --cask 'google-chrome'
brew install --cask 'google-drive'
brew install --cask 'imageoptim'
brew install --cask 'phpmon'
brew install --cask 'visual-studio-code'
brew install --cask 'tableplus'
brew install --cask 'warp'
brew install --cask 'raycast'
brew install --cask 'obsidian'
brew install --cask 'figma'
brew install --cask 'postman'
brew install --cask 'discord'
brew install --cask 'zoom'
brew install --cask 'rectangle' # Window management
brew install --cask 'cleanshotx' # Screenshot tool
brew install --cask 'appcleaner'
brew install --cask 'the-unarchiver'
brew install --cask 'iterm2'
brew install --cask 'tinkerwell' # PHP REPL
brew install --cask 'helo' # Email testing

# Quicklook
brew install --cask 'qlmarkdown'
brew install --cask 'quicklook-json'
brew install --cask 'qlstephen'
brew install --cask 'quicklook-csv'

# Fonts
brew install --cask 'font-jetbrains-mono'
brew install --cask 'font-jetbrains-mono-nerd-font'
brew install --cask 'font-fira-code'
brew install --cask 'font-inter'
brew install --cask 'font-roboto'
brew install --cask 'font-source-code-pro'
brew install --cask 'font-source-sans-pro'

# Mac Apps
brew install --cask 'xcode'
brew install --cask 'keynote'
brew install --cask 'numbers'
brew install --cask 'things'
brew install --cask 'magnet'
