#! /bin/bash

# Uncomment for nvidia drivers
#sudo add-apt-repository ppa:graphics-drivers/ppa
#sudo apt update
#sudo apt install nvidia-driver-410

# basic packages
sudo apt-get install aptitude
sudo aptitude install kolourpaint4 kate kdevelop git terminator

# visual code
wget https://go.microsoft.com/fwlink/?LinkID=760868
mv https://go.microsoft.com/fwlink/?LinkID=760868 vs_code.deb
sudo apt install ./vs_code.deb
rm vs_code.deb

# Slack
wget -O slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.1.0-amd64.deb && sudo apt install ./slack.deb && rm slack.deb

# Power saving and related source: http://tipsonubuntu.com/2018/11/18/quick-tip-improve-battery-life-ubuntu-18-04-higher/
sudo add-apt-repository ppa:linuxuprising/apps
sudo aptitude install tlp powertop tlpui
