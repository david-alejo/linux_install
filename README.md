# linux_install

This is for reminding me about the main steps to get Ubuntu running in my GF62 7RE MSI laptop.

I found a great source for that:

https://gist.github.com/mari-linhares/cef4cb3440408e44963d1447a7db5ae0

### Getting a USB image into a USB

I recommend using unetbootin: https://unetbootin.github.io/

You should make a partition in the USB disk (if it is too large) of about 2GB of size and type FAT32. (in Ubuntu, the disks utility did the trick, also you can check the Gparted app in Linux).

Then run Unetbootin and install the operating system inside that partition.

### Starting from USB

The main issue is the security boot mode that must be disabled in the BIOS. To enter the BIOS, press "supr" key when the MSI logo is displayed at the startup.

Then, go to Security menu and disable the security boot option.

Also, there are several boot modes. Mainly UEFI and Legacy.

To be able to boot from a USB, the boot mode should be UEFI

### Linux installation:

I installed linux from a network installer that does not use graphic drivers and therefore does not get freezed at the startup.

However, you can use the regular installer and if it freezes, you can do the following:

Possible problem: Screen freezing while installing

    Reboot system
    Go to the Install Ubuntu option (BUT DONT PRESS ENTER)
    Press e
    Find the line that starts with linux then add modprobe.blacklist=nouveau after quiet splash.

When installing the OS, I let the Ubuntu installer to automatically handle the partition of my SDD of 256 GB and it was also installed in UEFI mode. 



### Drivers installation and more:

NVIDIA propietary drivers:

    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update

    sudo apt install nvidia-driver-410  
    sudo reboot


(You can change this driver to whatever version suits you best)

I have inside the script folder some scripts to install some libraries and programs that I find useful. Enjoy them and please tell me any different software you usually add to Ubuntu.
