#! /bin/bash

if [[ $(lspci |grep VGA |grep NVIDIA) ]]; then
   if [[ $(lspci -k | grep -A 2 -E "(VGA|3D)" |grep "Kernel driver in use: nvidia") ]]; then
       NVSUCCESS=1
   else
       echo You need to install the Nvidia driver and utilities first! 
       pkexec /usr/share/panda-tools/nvidia-installer.sh    
       sync  && return
   fi
fi
#! /bin/bash

if [[ -d "/usr/lib/wine" ]]; then
       echo Wine is already installed.
   else
       echo Wine needs to be installed first.
       pkexec pacman -Sy wine lib32-libldap lib32-gnutls lib32-libpulse gst-plugins-good gst-libav dxvk-mingw-git lib32-alsa-lib --noconfirm
fi
if [[ -d "/home/$USER/wine" ]]; then
       echo the Wine containers folder already exists.
   else
       mkdir /home/$USER/wine
fi
export WINEPREFIX="/home/$USER/wine/bnet"
wineboot -u
sync
sleep 10
/usr/share/dxvk/setup_dxvk.sh install --symlink
sync
cp /usr/share/game-tools/icons/* /home/$USER/.local/share/icons/hicolor/48x48/apps/
wine /usr/share/game-tools/Battle.net-Setup.exe
