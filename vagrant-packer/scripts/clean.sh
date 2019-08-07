#!/bin/sh
set -eux

yum clean all -y

rm /tmp/* -fr
rm /var/tmp/* -fr
rm /var/cache/* -fr
find /var/log -type f -delete

rm .bash_history -f
history -c

dd if=/dev/zero of=zerofill bs=1M ||:
rm zerofill -f
sync
