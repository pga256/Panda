#! /bin/bash
cp ./full.x86_64 ./packages.x86_64
cp ./profilefull.sh ./profiledef.sh
./mkpandaiso -v -w ../tmp/game-v2-offline -o ./out ./
sync
rm ./packages.x86_64
rm ./profiledef.sh
exit

