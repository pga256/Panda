#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="panda-v$( date +%y ).$( date +%m ).$( date +%d )"
iso_label="panda-$( date +%y ).$( date +%m )-$( date +%d )$( date +%h )"
iso_publisher="PGA"
iso_application="Panda Live"
iso_version="Nvidia"
install_dir="panda"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'uefi-x64.grub.esp' 'bios.syslinux.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:0400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)
