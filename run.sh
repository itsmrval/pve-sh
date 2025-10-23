#!/bin/sh

rm -r /etc/apt/source.list.d/ceph.list
rm -r /etc/apt/sources.list.d/pve-enterprise.list
rm -r /etc/apt/sources.list
wget -O /etc/apt/sources.list https://raw.githubusercontent.com/itsmrval/pve-sh/main/sources.list
# wget -O /etc/apt/sources.list.d/ceph.list https://raw.githubusercontent.com/itsmrval/pve-sh/main/ceph.list

apt update 
apt upgrade -y

lvremove /dev/pve/data
lvresize -l +100%FREE /dev/pve/root
resize2fs /dev/mapper/pve-root

i=0
while [ $i -ne 100 ]
do
        i=$(($i+1))
        echo ""
done

echo " Script ended - /!\ remember to remove the local lvm entry in the datacenter section \n\n\n"
