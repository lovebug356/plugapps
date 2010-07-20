#!/bin/sh
die() {
    echo "$1"
    exit 1
}
make mrproper
make sheevaplug_config
make u-boot.kwb
echo "Building u-boot.bin.pagesize..."

bytes=$(stat --format='%s' u-boot.bin)
fillbytes=$[524288-$bytes]
cp u-boot.bin u-boot.bin.pagesize

while [ $fillbytes -ne 0 ]; do
  printf "\xff" >>u-boot.bin.pagesize
  fillbytes=$[$fillbytes-1]
done
exit 0