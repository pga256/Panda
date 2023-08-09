#! /bin/bash

CARD="$(lspci |grep VGA)"
NV=0
NVLOADED=0
for line in $(cat /usr/share/panda-tools/Nvidia_470.list); do
    if echo $CARD |grep $line
    then
        NV=1 
    fi    
done
if [[ $NV -eq 1 ]] 
    then
        echo Legacy Nvidia card Detected.  Installing Nvidia 470 Driver components.
        pacman -Sy nvidia-470xx-dkms nvidia-470xx-utils lib32-nvidia-470xx-utils nvidia-470xx-settings \
        vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm
    else
        echo Nvidia card Detected.  Installing Nvidia Driver components.
        pacman -Sy nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings \
        vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm
fi
mkinitcpio -P
sync
NVLOADED=$(lspci -k | grep -A 2 -E "(VGA|3D)" |grep "Kernel driver in use: nvidia")
if  [[ $NVLOADED ]]
    then    
        read -s -n 1 -p "SUCCESS!  Nvidia drivers have been installed. ** Reboot needed. ** Press a key to exit . . ."
        echo 'NoDisplay=true' >> /usr/share/applications/Nvidia-Installer.desktop
        echo 'NoDisplay=true' >> /usr/share/panda-tools/Nvidia-Installer.desktop
    else
        read -s -n 1 -p "Nvidia drivers have not been installed. Press a key to exit . . ."
fi
exit