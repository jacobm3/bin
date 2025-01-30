https://svennd.be/create-zfs-raidz2-pool/
https://wiki.archlinux.org/title/ZFS/Virtual_disks

fdisk -l /dev/sd* | grep Disk

POOLNAME="$(hostname)-tank"
zpool create $POOLNAME raidz2 /dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg /dev/sdh /dev/sdi /dev/sdj /dev/sdk /dev/sdl

zfs list

zpool status

zfs set xattr=sa $POOLNAME
zfs set acltype=posixacl $POOLNAME
zfs set compression=lz4 $POOLNAME
zfs set atime=off $POOLNAME
zfs set relatime=on $POOLNAME
zfs set recordsize=1M panda
