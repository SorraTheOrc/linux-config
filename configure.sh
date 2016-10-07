# Configure a Linux Machine

# Versions

DOCKER_COMPOSE_VERSION=1.7.1

# Network Time Protocol

sudo ntpdate -b pool.ntp.org  

# Preparation

SCRIPT_DIR=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
sudo apt-get update
sudo apt-get upgrade -y

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

sudo curl -sSL https://get.docker.com/ | sh

curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo mv docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker ${USER}

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





