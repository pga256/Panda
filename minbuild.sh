#! /bin/bash
cp ./minimal.x86_64 ./packages.x86_64
cp ./profileminimal.sh ./profiledef.sh
cp ./airootfs/etc/calamares/branding/panda/minimal.desc ./airootfs/etc/calamares/branding/panda/branding.desc
./mkpandaiso -v -w /tmp/panda -o ./out ./
sync
rm ./packages.x86_64
rm ./profiledef.sh
rm ./airootfs/etc/calamares/branding/panda/branding.desc
exit

