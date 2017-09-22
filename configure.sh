# Configure a Linux Machine

EMAIL=ross@gardler.org

# Bash config

cp .bashrc ~
source ~/.bashrc

cp .profile ~
source ~/.profile

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

sudo apt-get install -y ruby
sudo apt-get install -y python-pip
sudo apt-get install -y lynx
sudo apt-get install -y vi
sudo apt-get install -y subversion

## Go

curl https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz > golang.tar.gz
tar -C /usr/local -xvf golang.tar.gz
rm golang.tar.gz

## git 

cp .gitinore ~/.gitignore
git config --global core.excludesfile '~/.gitignore'

git config --global user.name "Ross Gardler"
git config --global user.email "ross@gardler.org"
git config credential.helper "store" 
git config --global push.default simple

### Hub CLI - https://github.com/github/hub

HUB_CLI_VERSION=hub-linux-amd64-2.3.0-pre10
curl -L https://github.com/github/hub/releases/download/v2.3.0-pre10/$HUB_CLI_VERSION.tgz > $HUB_CLI_VERSION.tgz
sudo tar -C /usr/local/bin -xvf $HUB_CLI_VERSION.tgz
sudo /usr/local/bin/$HUB_CLI_VERSION/install
rm $HUB_CLI_VERSION.tgz
echo 'eval "$(hub alias -s)"' >> ~/.profile
sudo /usr/local/bin/$HUB_CLI_VERSION/etc/hub.bash_completion.sh

## Java
sudo apt-get install -y default-jdk

## Scala
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get -y install sbt

# Tmux

sudo gem install tmuxinator
cp .tmux.conf ~

# Docker

sudo apt-get -y install apt-transport-https \
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

# Kubernetes

sudo az acs kubernetes install-cli
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | sudo bash

# git 
sudo apt-get -y install git

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

mkdir -p ~/bin

# Emacs
sudo apt-get install -y emacs24-nox
mkdir -p ~/.emacs.d/lisp
wget https://raw.githubusercontent.com/jwiegley/use-package/master/use-package.el -O ~/.emacs.d/lisp/use-package.el
wget https://raw.githubusercontent.com/jwiegley/use-package/master/bind-key.el -O ~/.emacs.d/lisp/bind-key.el
cp -R .emacs.d/* ~/.emacs.d

# Load bashrc and profile

source ~/.bashrc
source ~/.profile



