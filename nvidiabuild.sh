#! /bin/bash
cp ./nvidia.x86_64 ./packages.x86_64
cp ./profilenvidia.sh ./profiledef.sh
cp ./airootfs/etc/calamares/branding/panda/nvidia.desc ./airootfs/etc/calamares/branding/panda/branding.desc
./mkpandaiso -v -w ./work/panda -o ./out ./
sync
rm ./packages.x86_64
rm ./profiledef.sh
rm ./airootfs/etc/calamares/branding/panda/branding.desc
exit

