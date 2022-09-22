#!/bin/bash

echo  -ne "

██████╗ ███████╗██████╗ ███╗   ███╗██╗███████╗███████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔════╝██╔══██╗████╗ ████║██║██╔════╝██╔════╝██║██╔═══██╗████╗  ██║██╔════╝
██████╔╝█████╗  ██████╔╝██╔████╔██║██║███████╗███████╗██║██║   ██║██╔██╗ ██║███████╗
██╔═══╝ ██╔══╝  ██╔══██╗██║╚██╔╝██║██║╚════██║╚════██║██║██║   ██║██║╚██╗██║╚════██║
██║     ███████╗██║  ██║██║ ╚═╝ ██║██║███████║███████║██║╚██████╔╝██║ ╚████║███████║
╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                                                
"
echo -ne "
-----------------------------------------------------------------------------
|             --- Giving Permission to Shell scripts ---                    |
-----------------------------------------------------------------------------
"
# Permissions fot the Arch Linux System 
# Permisison for the deep learning Section
cd ../
cd arch
cd deep-learning
chmod +x arch-deep-learning.sh
chmod +x arch-deep-compoents.sh

# Permission for the arch web development Section
cd ../
cd web-development
chmod +x arch-web-development.sh
chmod +x arch-web-development-compoents.sh

cd ../
cd ../

# Net Connection script Permission Section

cd connection
chmod +x net-connection.sh
cd ../

# Permission for Debian System

# Deep Learning
cd debian
cd deep-learning
chmod +x debian-deep-learning.sh
chmod +x debian-deep-compoent.sh

# Web Development
cd ../
cd web
chmod +x debian-web-development.sh
chmod +x debian-web-compoent.sh

cd ../
cd ../


# Permssion for the Os detection section
cd OS
chmod +x os.sh
cd ../

# Permission for the Reboot section
cd reboot
chmod +x reboot.sh
cd ../







