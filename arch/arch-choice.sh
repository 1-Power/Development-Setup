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
        - base-devel
        - arch keyring
-------------------------------------------------------------------------
"

PKGS=(
    'git'
    'wget'
    'curl'
    'base-devel'
    'archlinux-keyring'
    'pkg-config'
)

for PKG in "${PKGS[@]}"; do
    echo -ne "
-------------------------------------------------------------------------
          --- Installing $PKG --- 
-------------------------------------------------------------------------
      Installing ${PKG}..."
    sudo pacman -S --noconfirm --needed $PKGS
done

# Removeing Password for Normal User
# IT is imporatnt to do this before installing paru or any Aur Helper
# At the end of the script it will be set back to the default
# sudo sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
# sudo sed -i 's/^# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers

# Remove no password sudo rights
sudo sed -i 's/^%wheel ALL=(ALL) NOPASSWD: ALL/# %wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
sudo sed -i 's/^%wheel ALL=(ALL:ALL) NOPASSWD: ALL/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers

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
-------------------------------------------------------------------------------------------
███████╗███████╗████████╗██╗   ██╗██████╗      ██████╗██╗  ██╗ ██████╗ ██╗ ██████╗███████╗
██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    ██╔════╝██║  ██║██╔═══██╗██║██╔════╝██╔════╝
███████╗█████╗     ██║   ██║   ██║██████╔╝    ██║     ███████║██║   ██║██║██║     █████╗  
╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     ██║     ██╔══██║██║   ██║██║██║     ██╔══╝  
███████║███████╗   ██║   ╚██████╔╝██║         ╚██████╗██║  ██║╚██████╔╝██║╚██████╗███████╗
╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝          ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝ ╚═════╝╚══════╝
-------------------------------------------------------------------------------------------                                                                                          
"
function web_dev()
{
    echo -ne "
   ------------------------------------------------------------------------------------------------------------------------------- 
    ██╗    ██╗███████╗██████╗     ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗
    ██║    ██║██╔════╝██╔══██╗    ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
    ██║ █╗ ██║█████╗  ██████╔╝    ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
    ██║███╗██║██╔══╝  ██╔══██╗    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
    ╚███╔███╔╝███████╗██████╔╝    ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
     ╚══╝╚══╝ ╚══════╝╚═════╝     ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝ 
    ------------------------------------------------------------------------------------------------------------------------------   
    "
    cd web-development
    ./arch-web-development.sh
    cd ../

    echo -ne "
    -------------------------------------------------------------------------------------------------------------------
    ███████╗███████╗████████╗██╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗
    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝
    ███████╗█████╗     ██║   ██║   ██║██████╔╝    ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗  
    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝  
    ███████║███████╗   ██║   ╚██████╔╝██║         ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗
    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝          ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝                                                                                                                   
    --------------------------------------------------------------------------------------------------------------------
    "
    

}
function deep_dev()
{
    echo -ne "
    ----------------------------------------------------------------------------------------------------
    ██████╗ ███████╗███████╗██████╗     ██╗     ███████╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ 
    ██╔══██╗██╔════╝██╔════╝██╔══██╗    ██║     ██╔════╝██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ 
    ██║  ██║█████╗  █████╗  ██████╔╝    ██║     █████╗  ███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
    ██║  ██║██╔══╝  ██╔══╝  ██╔═══╝     ██║     ██╔══╝  ██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║
    ██████╔╝███████╗███████╗██║         ███████╗███████╗██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝
    ╚═════╝ ╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝                                                                                                 
    ----------------------------------------------------------------------------------------------------
    "
    cd deep-learning
    ./arch-deep-compoents.sh
    ./arch-deep-learning.sh
    cd ../

    echo -ne "
    -------------------------------------------------------------------------------------------------------------------
    ███████╗███████╗████████╗██╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗
    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝
    ███████╗█████╗     ██║   ██║   ██║██████╔╝    ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗  
    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝  
    ███████║███████╗   ██║   ╚██████╔╝██║         ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗
    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝          ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝                                                                                                                   
    --------------------------------------------------------------------------------------------------------------------
    "

}
function game_dev()
{
    clear
    echo "Sorry, this is not available yet"
    echo "Plase Enter Another Development Environment"
    menu
}
function python_dev()
{
    clear
    echo "Sorry, this is not available yet"
    echo "Plase Enter Another Development Environment"
    menu
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
    -------------------------------------------------------------------------
    "

    read  user_choice
    
    case $user_choice in 
        1) web_dev ;;
        2) deep_dev ;;
        3) game_dev ;;
        4) python_dev ;;
        *) 
            clear
            echo "Invalid Choice" 
            menu
            ;;
    esac
}
menu