#!/usr/bin/env bash

systemctl enable NetworkManager.service
rm /usr/lib/NetworkManager/conf.d/*
chmod a+x /usr/share/panda-tools/nvidia-installer.sh
exit
