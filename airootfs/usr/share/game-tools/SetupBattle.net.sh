#! /bin/bash

export WINEPREFIX="/home/$USER/wine/bnet" WINEDEBUG=-all DXVK_LOG_LEVEL=none WINEDLLOVERRIDES=mshtml,mscoree=d
wineboot -u 
wget http://dist.blizzard.com/downloads/bna-installers/322d5bb9ae0318de3d4cde7641c96425/retail.1/Battle.net-Setup-enGB.exe -P /tmp/
sync
/usr/share/dxvk/setup_dxvk.sh install --symlink
sync
cp /usr/share/game-tools/icons/* /home/$USER/.local/share/icons/hicolor/48x48/apps/
wine /tmp/Battle.net-Setup-enGB.exe
rm /tmp/Battle.net-Setup-enGB.exe
