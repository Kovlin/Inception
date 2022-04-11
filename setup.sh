#!/bin/bash

if [[ $OSTYPE == 'darwin'* ]]; then

    # on MacOS

    mkdir -p ./volumes/wp_volume
    mkdir -p ./volumes/db_volume

    exit
fi

# on Linux

echo 'user42' | sudo -S mkdir -p /home/rlinkov/data/wp_volume
echo 'user42' | sudo -S mkdir -p /home/rlinkov/data/db_volume

echo 'user42' | sudo -S chmod 777 /etc/hosts
echo 'user42' | sudo -S hostnamectl set-hostname rlinkov.42.fr
echo 'user42' | sudo -S sed -i 's/salty-VirtualBox/rlinkov.42.fr/g' /etc/hosts
echo 'user42' | sudo -S sed -i '3i 127.0.0.1    rlinkov.42.fr/g' /etc/hosts
echo 'user42' | sudo -S chmod 0444 /etc/hosts

echo 'user42' | sudo -S service nginx stop
echo 'user42' | sudo -S systemctl start docker