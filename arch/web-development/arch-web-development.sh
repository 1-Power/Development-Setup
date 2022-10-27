#!/bin/bash

clear
echo -ne "
-------------------------------------------------------------------------------------------------------------------------------
██╗    ██╗███████╗██████╗     ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗
██║    ██║██╔════╝██╔══██╗    ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
██║ █╗ ██║█████╗  ██████╔╝    ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
██║███╗██║██╔══╝  ██╔══██╗    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
╚███╔███╔╝███████╗██████╔╝    ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
 ╚══╝╚══╝ ╚══════╝╚═════╝     ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
-------------------------------------------------------------------------------------------------------------------------------                                                                                                                              
"
# Removing Packages for conflits
application_remove=(
    'openbsd-netcat'
)
for application_remove in "${application_remove[@]}"; do
    echo "
----------------------------------------------------------------------
        Removing "${application_remove}"
----------------------------------------------------------------------
    "
    sudo pacman -Rns $application_remove --noconfirm 
done

# Installing Packages using Arch Repository
application_pacman=(
        'curl'
        'zip'
        'unzip'
        'unrar'
        'virt-manager'
        'qemu'
        'qemu-arch-extra'
        'ovmf'
        'vde2'
        'ebtables'
        'dnsmasq'
        'bridge-utils'
        'discord'
        'npm'
        'firefox'
        'neovim'
    )
for application_pacman in "${application_pacman[@]}"; do
    
    echo "
-------------------------------------------------------------------------
          INSTALLING: "${application_pacman}"
-------------------------------------------------------------------------
         "    
    # echo  "INSTALLING: ${application_pacman}"
    sudo pacman -S "$application_pacman" --noconfirm --needed
done

# Installing two of the most used packages nodemon and firebase database 
npm_packages(
    'nodemon'
    'firebase'
)
for npm_packages in "${npm_packages[@]}"; do
    echo "
-------------------------------------------------------------------------
          INSTALLING: "${npm_packages}"
-------------------------------------------------------------------------
         " 
    sudo npm install -g "$npm_packages" 
done


# Installing Application using AUR 
application_paru=(
            'microsoft-edge-stable-bin'
            'brave-bin'
            'google-chrome'
            'visual-studio-code-bin'
            'github-desktop-bin'
            'xampp'
        )

#The installing of application using paru
for application_paru in "${application_paru[@]}"; do
    echo "
-------------------------------------------------------------------------
          INSTALLING: "${application_paru}"
-------------------------------------------------------------------------
         " 
    # echo "INSTALLING: ${application_paru}"
    paru -S  "$application_paru" --noconfirm --needed
done



# Enabling Virtualization
echo "
-------------------------------------------------------------------------
          Enabling Virtual Machine Services
-------------------------------------------------------------------------" 
# Enabling Virtual Machine For Arch linux
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
cp -r  br10.xml  ~/
cd ~
sudo virsh net-define br10.xml
sudo virsh net-start br10
sudo virsh net-autostart br10
cd - 

