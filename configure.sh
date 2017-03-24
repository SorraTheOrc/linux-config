# Configure a Linux Machine

EMAIL=ross@gardler.org

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
    curl -L https://aka.ms/InstallAzureCli | bash
fi

# Programming

sudo apt-get install -y ruby
sudo apt-get install -y python-pip
sudo apt-get install -y lynx
sudo apt-get install -y vi
sudo apt-get install -y subversion

## Java
sudo apt-get install default-jdk

## Scala
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get -y install sbt

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
mkdir -p ~/.emacs.d/lisp
wget https://raw.githubusercontent.com/jwiegley/use-package/master/use-package.el -O ~/.emacs.d/lisp/use-package.el
wget https://raw.githubusercontent.com/jwiegley/use-package/master/bind-key.el -O ~/.emacs.d/lisp/bind-key.el
cp -R .emacs.d/* ~/.emacs.d





