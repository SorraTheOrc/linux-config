# Configure a Linux Machine

# Bash config

cp .bashrc ~
source ~/.bashrc

cp .profile ~
source ~/.profile

mkdir -p ~/bin

# Network Time Protocol

sudo ntpdate -b pool.ntp.org  

# Preparation

SCRIPT_DIR=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
sudo apt-get update
sudo apt-get upgrade -y
mkdir -p ~/projects

# SSH
if [ ! -f "~/.ssh/id_rsa.pub"]; then
    ssh-keygen -t rsa -b 4096 -C "$EMAIL" -F "~/.ssh/id_rsa" -N ""
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa
fi

# Azure CLI

if hash az 2>/dev/null; then
    az component update
else
    sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
    sudo apt-get install -y python3-pip
    curl -L https://aka.ms/InstallAzureCli | bash
fi

# Terminal Utils
sudo apt-get install -y xclip

# Programming

sudo apt-get install -y python-pip
sudo apt-get install -y lynx
sudo apt-get install -y vi
sudo apt-get install -y subversion

# Kubernetes

sudo az acs kubernetes install-cli
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | sudo bash

# git 
sudo apt-get -y install git

cp .gitignore ~/.gitignore
git config --global core.excludesfile '~/.gitignore'

git config credential.helper "store" 
git config --global push.default simple

# Emacs
sudo apt-get install -y emacs24-nox
mkdir -p ~/.emacs.d/lisp
cp -R .emacs.d/* ~/.emacs.d

# Load bashrc and profile

source ~/.bashrc
source ~/.profile



