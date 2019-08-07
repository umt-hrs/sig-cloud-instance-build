#!/bin/sh
set -eux

yum install epel-release -y
yum install dkms -y

mount -o loop -t iso9660 VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions.iso
rm .vbox_version
