#! /bin/bash

pacman -Sy nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings \
vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm

sync

read -s -n 1 -p "Nvidia drivers have been installed. ** Reboot recommended. ** Press a key to exit . . ." 
exit