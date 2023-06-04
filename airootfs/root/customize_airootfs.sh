#!/usr/bin/env bash

systemctl disable systemd-networkd.service
systemctl disable systemd-networkd.socket
systemctl enable dhcpcd
exit
