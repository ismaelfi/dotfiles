#!/bin/sh

echo "Setting up your AWS-focused DevOps environment (Lightweight Configuration)..."

# Install git first
brew install git

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Taps
brew tap 'homebrew/cask-versions'

# Python Installation and Setup
brew install python@3.11
brew install python@3.10
brew install python@3.9
brew install pyenv # For Python version management
brew install poetry # Python dependency management
brew install pipx # Install Python applications in isolated environments

# Essential Python Packages
pip3 install --upgrade pip
pip3 install virtualenv
pip3 install ipython
pip3 install pytest
pip3 install black # Code formatter
pip3 install flake8 # Linter
pip3 install mypy # Static type checker
pip3 install jupyter

# Essential AWS & CLI Tools
brew install 'awscli'
brew install 'aws-sam-cli'
brew install 'aws-vault' # For AWS credentials management
brew install 'session-manager-plugin' # For AWS SSM
brew install 'jq' # JSON processor (essential for AWS CLI output)
brew install 'yq' # YAML processor
brew install 'bat' # Better cat
brew install 'tree' # Directory structure viewer
brew install 'watch' # Execute commands periodically

# Minimal Development Tools
brew install 'git'
brew install 'gh' # GitHub CLI
brew install 'tmux' # Terminal multiplexer for better resource management

# Basic Container Tools
brew install 'docker'
# Note: Docker Desktop might be heavy for 4GB RAM
# Consider using docker-machine or Colima as alternatives

# Essential Security Tools
brew install 'gnupg'
brew install 'openssl'

# Lightweight Apps
brew install --cask 'visual-studio-code'
brew install --cask 'iterm2'
brew install --cask 'cursor' # AI-powered code editor

# VS Code Extensions (AWS & Python focused)
code --install-extension 'amazonwebservices.aws-toolkit-vscode'
code --install-extension 'redhat.vscode-yaml'
code --install-extension 'ms-python.python'
code --install-extension 'ms-python.vscode-pylance'
code --install-extension 'vscodevim.vim' # Vim emulation
code --install-extension 'ms-vscode.sublime-keybindings' # Sublime Text keybindings
code --install-extension 'ms-azuretools.vscode-docker' # Docker support
code --install-extension 'eamodio.gitlens' # Git supercharged
code --install-extension 'ms-vscode.powershell' # PowerShell support
code --install-extension 'ms-vscode-remote.remote-containers' # Remote Containers
code --install-extension 'ms-vscode-remote.remote-ssh' # Remote SSH
code --install-extension 'ms-vscode-remote.remote-wsl' # Windows Subsystem for Linux
code --install-extension 'ms-vscode.remote-explorer' # Remote Explorer
code --install-extension 'ms-vscode.vscode-typescript-tslint-plugin' # TSLint
code --install-extension 'dbaeumer.vscode-eslint' # ESLint
code --install-extension 'esbenp.prettier-vscode' # Prettier
code --install-extension 'editorconfig.editorconfig' # EditorConfig
code --install-extension 'streetsidesoftware.code-spell-checker' # Code Spell Checker

# Basic Font
brew install --cask 'font-jetbrains-mono'

# Set up some basic git configurations
git config --global pull.rebase true
git config --global init.defaultBranch main

# Optional tools (Commented out due to resource constraints)
# Consider installing these with more RAM:
# brew install 'terraform' # Infrastructure as Code
# brew install 'kubectl' # Kubernetes CLI
# brew install 'helm' # Kubernetes package manager
# brew install 'lens' # Kubernetes IDE
# brew install 'prometheus' # Monitoring
# brew install 'grafana' # Monitoring UI
# brew install 'ansible' # Configuration management
# brew install --cask 'docker' # Docker Desktop
# brew install 'minikube' # Local Kubernetes
# brew install 'kind' # Kubernetes in Docker

# Performance Optimizations
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf

# Create a swap file if needed
# sudo fallocate -l 4G /swapfile
# sudo chmod 600 /swapfile
# sudo mkswap /swapfile
# sudo swapon /swapfile

echo "AWS-focused DevOps environment setup complete!"
echo "Note: Some heavier tools have been commented out due to resource constraints."
echo "Consider upgrading RAM to 8GB+ for a more complete DevOps environment."
