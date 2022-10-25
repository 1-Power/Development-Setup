#!/bin/bash

echo -ne "

██╗    ██╗███████╗██████╗     ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗
██║    ██║██╔════╝██╔══██╗    ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
██║ █╗ ██║█████╗  ██████╔╝    ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
██║███╗██║██╔══╝  ██╔══██╗    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
╚███╔███╔╝███████╗██████╔╝    ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
 ╚══╝╚══╝ ╚══════╝╚═════╝     ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
                                                                                                                              
"
# Removing Packages for conflits
application_remove={
    'openbsd-netcat'
}
for application_remove in "${application_remove[@]}"; do
    echo "
----------------------------------------------------------------------
        Removing "${application_remove}"
----------------------------------------------------------------------
    "
    sudo pacman -Rns $application_remove --noconfirm --needed
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

# Installing Application using AUR 
application_paru=(
            'microsoft-edge-stable-bin'
            'xampp'
            'brave-bin'
            'google-chrome'
            'visual-studio-code-bin'
            'github-desktop-bin'
            'nodejs-git'
            'webstorm'
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

# Add sudo rights
sudo sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
sudo sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

sudo pacman -Syyu --noconfirm --needed
