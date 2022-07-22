#! /bin/bash
echo "Welcome to the Chur\'s packages install script. Installing zenity"
sudo apt install -y zenity 

zenity --info \
       --title="Basic packages install" \
       --width=250 \
       --text="Installing basic packages for using Ubuntu at the Chur's way"

# Nvidia drivers
zenity --question \
       --title="Installing NVidia drivers" \
       --width=250 \
       --text="Install nvidia drivers. Do you want to proceed?"
ans=$?
if [ $ans -eq 0 ]
then
    echo "Installing NVidia drivers"
    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update
    sudo apt install nvidia-driver-410 -y
else
    echo "Skipping NVidia drivers"
fi


# basic packages
sudo apt-get install aptitude -y
sudo aptitude install -y ssh git terminator shellcheck vim ncdu mlocate # Basic stuff

# KDE -related stuff (I love it) 
sudo aptitude install -y kate kdevelop kompare kolourpaint4 okular krita

# Multimedia packages
sudo aptitude install -y vlc kdenlive # Earlier to 18.04 it's better to install the app image https://kdenlive.org/en/download/

# visual code
zenity --question \
       --title="Install VS Code" \
       --width=250 \
       --text="Install VS Code. Do you want to proceed?"
ans=$?
if [ $ans -eq 0 ]
then
    echo "Installing VS Code "
    wget -O vs_code.deb https://go.microsoft.com/fwlink/?LinkID=760868 
    sudo apt install ./vs_code.deb
    rm vs_code.deb
else
    echo "Did not install VS Code"
fi

# Slack
sudo snap install slack --classic

# Power saving and related source: http://tipsonubuntu.com/2018/11/18/quick-tip-improve-battery-life-ubuntu-18-04-higher/
zenity --question \
       --title="Install Power Utilities (Laptops)" \
       --width=250 \
       --text="Installing Powertop Utilities for Laptops. Do you want to proceed?"
ans=$?
if [ $ans -eq 0 ]
then
    echo "Installing powertop utilities"
    sudo add-apt-repository ppa:linuxuprising/apps
    sudo aptitude install -y tlp powertop tlpui
else
    echo "Did not install powertop utilities"
fi

#Configure bashrc with stuff
zenity --question \
       --title="Adding stuff to bashrc" \
       --width=250 \
       --text="Do you want to add aliases and the git checker to the bashrc? (Say no if already done)"
ans=$?
if [ $ans -eq 0 ]
then
    script_dir=$(dirname $0)
    cat "$script_dir"/git_checker.sh >> "$HOME"/.bashrc
    cat "$script_dir"/aliases.sh >> "$HOME"/.bash_aliases
    echo "Added git checker to bashrc and bash_aliases"
else
    echo "Did not add stuff to bashrc nor bash_aliases"
fi

zenity --question \
       --title="Adding emacs and more configuration" \
       --width=250 \
       --text="Do you want to add emacs and a utility to configure the keyboard?"
ans=$?
if [ $ans -eq 0 ]
then
     sudo apt install emacs gnome-tweaks
     
fi
