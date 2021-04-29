#! /bin/bash

# Nvidia drivers
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-410 -y

# basic packages
sudo apt-get install aptitude -y
sudo aptitude install -y ssh git terminator    # Basic stuff

# KDE -related stuff (I love it) 
sudo aptitude install -y kate kdevelop kompare kolourpaint4 shellcheck


# Multimedia packages
sudo aptitude install -y vlc kdenlive # Earlier to 18.04 it's better to install the app image https://kdenlive.org/en/download/

# visual code
wget -O vs_code.deb https://go.microsoft.com/fwlink/?LinkID=760868 
sudo apt install ./vs_code.deb
rm vs_code.deb

# Slack
sudo snap install slack --classic

# Power saving and related source: http://tipsonubuntu.com/2018/11/18/quick-tip-improve-battery-life-ubuntu-18-04-higher/
sudo add-apt-repository ppa:linuxuprising/apps
sudo aptitude install -y tlp powertop tlpui

sudo apt install -y vim

#Configure bashrc with stuff
script_dir=$(dirname $0)
cat "$script_dir"/git_checker.sh >> "$HOME"/.bashrc
cat "$script_dir"/aliases.sh >> "$HOME"/.bash_aliases