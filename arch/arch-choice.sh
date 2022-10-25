#!/bin/bash


echo -ne "

██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ██╗███╗   ██╗ ██████╗      ██████╗ ██████╗ ███╗   ███╗██████╗  ██████╗ ███╗   ██╗███████╗███╗   ██╗████████╗███████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██║████╗  ██║██╔════╝     ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔═══██╗████╗  ██║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ██║██╔██╗ ██║██║  ███╗    ██║     ██║   ██║██╔████╔██║██████╔╝██║   ██║██╔██╗ ██║█████╗  ██╔██╗ ██║   ██║   ███████╗
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██║██║╚██╗██║██║   ██║    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║   ██║██║╚██╗██║██╔══╝  ██║╚██╗██║   ██║   ╚════██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██║██║ ╚████║╚██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ╚██████╔╝██║ ╚████║███████╗██║ ╚████║   ██║   ███████║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
                                                                                                                                                                          

"

echo echo -ne "
-------------------------------------------------------------------------
            --- Arch Dependicies Install Script ---
-------------------------------------------------------------------------
"

# File Location
PARU_LOCATION=/usr/bin/paru

# Programs
echo -ne "
-------------------------------------------------------------------------
        --- Installing A couple of Dependicies ---

    - Dependicies:
        - git
        - wget
        - curl
        -base-devel
        -arch keyring
-------------------------------------------------------------------------
"

PKGS=(
    'git'
    'wget'
    'curl'
    'base-devel'
    'archlinux-keyring'
)

for PKG in "${PKGS[@]}"; do
    echo -ne "
    -------------------------------------------------------------------------
                        --- Installing $PKG --- 
    -------------------------------------------------------------------------
      Installing ${PKG}..."
    sudo pacman -S --noconfirm --needed $PKGS
done


# sudo pacman -S git wget curl rust  --noconfirm --needed
# sudo pacman -S --needed base-devel --noconfirm --needed
# sudo pacman -Sy archlinux-keyring --noconfirm --needed


# Enable parallel download && enable multreb -repo
echo -ne "
-------------------------------------------------------------------------
        --- Enable Parallel Download && Enable multilib ---
-------------------------------------------------------------------------
"
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

#Enable multilib
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

echo -ne "
-------------------------------------------------------------------------
        --- Update System ---
-------------------------------------------------------------------------
"
sudo pacman -Syyu --noconfirm --needed

echo -ne "
-------------------------------------------------------------------------
            ---Install AUR Helper paru ---
-------------------------------------------------------------------------
"

# Install paru 
if [ ! -e "$PARU_LOCATION" ]; 
then
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ../
    #Removing paru Folder 
    sudo rm -rf paru
    echo -ne "
-------------------------------------------------------------------------
            --- Paru is Installed ---
-------------------------------------------------------------------------
"
else  
    echo -ne "
-------------------------------------------------------------------------
            --- Paru is Installed ---
-------------------------------------------------------------------------
"
fi


echo -ne "

███████╗███████╗████████╗██╗   ██╗██████╗      ██████╗██╗  ██╗ ██████╗ ██╗ ██████╗███████╗
██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    ██╔════╝██║  ██║██╔═══██╗██║██╔════╝██╔════╝
███████╗█████╗     ██║   ██║   ██║██████╔╝    ██║     ███████║██║   ██║██║██║     █████╗  
╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     ██║     ██╔══██║██║   ██║██║██║     ██╔══╝  
███████║███████╗   ██║   ╚██████╔╝██║         ╚██████╗██║  ██║╚██████╔╝██║╚██████╗███████╗
╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝          ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝ ╚═════╝╚══════╝
                                                                                          
"
function web_dev()
{
    echo -ne "
    
    ██╗    ██╗███████╗██████╗     ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗
    ██║    ██║██╔════╝██╔══██╗    ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
    ██║ █╗ ██║█████╗  ██████╔╝    ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
    ██║███╗██║██╔══╝  ██╔══██╗    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
    ╚███╔███╔╝███████╗██████╔╝    ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
     ╚══╝╚══╝ ╚══════╝╚═════╝     ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
    "
    cd web-development
    ./arch-web-development.sh
    cd ../

    echo -ne "
        
    ███████╗███████╗████████╗██╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗
    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝
    ███████╗█████╗     ██║   ██║   ██║██████╔╝    ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗  
    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝  
    ███████║███████╗   ██║   ╚██████╔╝██║         ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗
    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝          ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝                                                                                                                   
    "
    

}
function deep_dev()
{
    echo -ne "

    ██████╗ ███████╗███████╗██████╗     ██╗     ███████╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ 
    ██╔══██╗██╔════╝██╔════╝██╔══██╗    ██║     ██╔════╝██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ 
    ██║  ██║█████╗  █████╗  ██████╔╝    ██║     █████╗  ███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
    ██║  ██║██╔══╝  ██╔══╝  ██╔═══╝     ██║     ██╔══╝  ██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║
    ██████╔╝███████╗███████╗██║         ███████╗███████╗██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝
    ╚═════╝ ╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝                                                                                                 
    "
    cd deep-learning
    ./arch-deep-compoents.sh
    ./arch-deep-learning.sh
    cd ../

    echo -ne "
    
    ███████╗███████╗████████╗██╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗
    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝
    ███████╗█████╗     ██║   ██║   ██║██████╔╝    ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗  
    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝  
    ███████║███████╗   ██║   ╚██████╔╝██║         ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗
    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝          ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝
                                                                                                                    
"
}
function menu()
{

    echo -ne "
    -------------------------------------------------------------------------
                --- Which Envieonment you want to Setup ---
            
            1. Web Development Environment
            2. Deep Learning Environment
            3. Game Development Environment
            4. Python Development Environment

                    --- Enter your Choice ---
    -------------------------------------------------------------------------"

    read -p $user_choice


    if [ $user_choice == 1 ]; then
        web_dev
    elif [ $user_choice == 2 ]; then
        deep_dev
    elif [ $user_choice == 3 ]; then
        echo -ne "Game Development is not available yet"
    elif [ $user_choice  == 4 ]; then
        echo -ne "Sorry Python Devleopment Environment is not available yet"
    else
        echo -ne "Invalid Choice"
    fi

}
menu