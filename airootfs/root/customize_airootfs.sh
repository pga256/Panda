#!/usr/bin/env bash

systemctl enable NetworkManager.service
rm /usr/lib/NetworkManager/conf.d/*
exit
