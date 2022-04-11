#!/bin/sh

if [[ $OSTYPE == 'darwin'* ]]; then

    # on MacOS

    mkdir -p ./volumes/wp_volume
    mkdir -p ./volumes/db_volume

    exit
fi

# on Linux

mkdir -p /home/rlinkov/data/wp_volume
mkdir -p /home/rlinkov/data/db_volume

echo 'user42' | sudo -S chmod 777 /etc/hosts
sed -i 's/localhost/rlinkov.42.fr/g' /etc/hosts