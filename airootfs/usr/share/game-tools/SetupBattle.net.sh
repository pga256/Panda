#! /bin/bash

if [[ $(lspci |grep VGA |grep NVIDIA) ]]; then
   if [[ $(lspci -k | grep -A 2 -E "(VGA|3D)" |grep "Kernel driver in use: nvidia") ]]; then
       NVSUCCESS=1
   else
       echo You need to install the Nvidia driver and utilities first! 
       pkexec /usr/share/panda-tools/nvidia-installer.sh    
       sync
   fi
fi
if [[ -d "/home/$USER/wine" ]]; then
       echo the Wine containers folder already exists.
   else
       mkdir /home/$USER/wine
fi
export WINEPREFIX="/home/$USER/wine/bnet"
wineboot -u
wget http://dist.blizzard.com/downloads/bna-installers/322d5bb9ae0318de3d4cde7641c96425/retail.1/Battle.net-Setup-enGB.exe -P /tmp/
sync
/usr/share/dxvk/setup_dxvk.sh install --symlink
sync
cp /usr/share/game-tools/icons/* /home/$USER/.local/share/icons/hicolor/48x48/apps/
wine /tmp/Battle.net-Setup-enGB.exe
rm /tmp/Battle.net-Setup-enGB.exe
