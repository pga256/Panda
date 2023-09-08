#!/usr/bin/env bash

pacman-key --init
pacman-key --populate archlinux chaotic
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --recv-key 349BC7808577C592 --keyserver keyserver.ubuntu.com
pacman-key --recv-key EE4780313838BB4D --keyserver keyserver.ubuntu.com
pacman-key --recv-key 29CD02430D2ABA44 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key EE4780313838BB4D
pacman-key --lsign-key 349BC7808577C592
pacman-key --lsign-key FBA220DFC880C036
pacman-key --lsign-key 29CD02430D2ABA44
pacman -Syy

systemctl enable NetworkManager.service
rm /usr/lib/NetworkManager/conf.d/*
chmod a+x /usr/share/panda-tools/nvidia-installer.sh
chmod a+x /usr/share/game-tools/SetupBattle.net.sh
chmod a+x /usr/share/game-tools/SetupSteam.sh
exit
