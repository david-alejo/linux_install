# linux_install

This is for reminding me about the main steps to get Ubuntu running in a MSI laptop.

I found a great source for that:

https://gist.github.com/mari-linhares/cef4cb3440408e44963d1447a7db5ae0

The main issue is the security boot mode that must be disabled in the BIOS. To enter the BIOS, press "supr" key when the MSI logo is displayed at the startup.

Then, go to Security menu and disable the security boot option.

Also, there are several boot modes. Mainly UEFI and Legacy.

To be able to boot from a USB, the boot mode should be UEFI
When installing the OS, it is adviced to install the GRUB in Legacy mode (and then you should change the boot mode in the BIOS to Legacy for running Linux).

- Linux installation:

I installed linux from a network installer that does not use graphic drivers and therefore does not get freezed at the startup.

However, you can use the regular installer and if it freezes, you can do the following:

Possible problem: Screen freezing while installing

    Reboot system
    Go to the Install Ubuntu option (BUT DONT PRESS ENTER)
    Press e
    Find the line that starts with linux then add modprobe.blacklist=nouveau after quiet splash.



- Drivers installation and more:

NVIDIA propietary drivers:

    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update

    sudo apt install nvidia-driver-410  
    sudo reboot


(You can chenge this driver to whatever version suits you best)

