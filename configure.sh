# Configure a Linux Machine

# Versions

DOCKER_COMPOSE_VERSION=1.7.1

# Network Time Protocol

sudo ntpdate -b pool.ntp.org  

# Preparation

SCRIPT_DIR=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
sudo apt-get update
sudo apt-get upgrade -y
mkdir -p ~/projects
mkdir -p ~/.emacs.d/lisp

# Azure CLI

sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
curl -L https://aka.ms/InstallAzureCli | bash

# Programming

sudo apt-get install -y ruby
sudo apt-get install -y python-pip
sudo apt-get install -y lynx
sudo apt-get install -y vi
sudo apt-get install -y subversion

# Tmuxinator

sudo gem install tmuxinator
cp .tmux.conf ~

# Docker

sudo apt-get install apt-transport-https \
     ca-certificates
curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
sudo add-apt-repository \
            "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

sudo apt-get update
sudo apt-get -y install docker-engine
sudo systemctl enable docker

sudo group add docker 
sudo usermod -aG docker $USER

# git 

cp .gitinore ~/.gitignore
git config --global core.excludesfile '~/.gitignore'

git config --global user.name "Ross Gardler"
git config --global user.email "ross@gardler.org"
git config credential.helper "store" 
git config --global push.default simple

# Bash config

cp .bashrc ~
source ~/.bashrc

cp .profile ~
source ~/.profile

# Emacs
sudo apt-get install -y emacs24-nox
wget https://raw.githubusercontent.com/jwiegley/use-package/master/use-package.el -O ~/.emacs.d/lisp/use-package.el
wget https://raw.githubusercontent.com/jwiegley/use-package/master/bind-key.el -O ~/.emacs.d/lisp/bind-key.el
cp -R .emacs.d/* ~/.emacs.d





