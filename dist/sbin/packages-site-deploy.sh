#!/usr/bin/env bash
apt install squashfs-tools
CWD=`pwd`
cd /container/site-packages
echo "Creating /container/site-packages.squashfs"
mksquashfs /container/site-packages  /container/site-packages.squashfs -comp lz4

echo "Copyng /container/site-packages.squashfs to /content/gdrive/"
cp /container/site-packages.squashfs /content/gdrive/
echo "Backup saved to /content/gdrive/site-packages.squashfs"
cd $CWD