#! /bin/bash

if [[ $(lspci |grep VGA |grep NVIDIA) ]]; then
   if [[ $(lspci -k | grep -A 2 -E "(VGA|3D)" |grep "Kernel driver in use: nvidia") ]]; then
       NVSUCCESS=1
   else
       echo You need to install the Nvidia driver and utilities first! 
       pkexec "/usr/share/panda-tools/nvidia-installer.sh"    
       sync
   fi
fi
pacman -Sy steam --noconfirm
read -s -n 1 -p "Steam has been installed and is available from the Panda menu.  Press a key to exit . . ." 
exit