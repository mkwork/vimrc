#!/bin/bash

set -ex

ram_amount=4096M

modprobe zram num_devices=4
sleep 0.5;
for i in {0..3}; 
do 
    zramctl -s ${ram_amount} /dev/zram${i} || sleep 2.5; zramctl -s ${ram_amount} /dev/zram${i};
    mkswap /dev/zram${i};
    swapon -p 32767 /dev/zram${i};
done
