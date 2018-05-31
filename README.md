# Linux-Nvidia-ETH-Overlocker
Script to automate overlocking Nvidia cards miing Ethereum on Linux

The script needs optimized as I haven't written linux scripts in a while.
Script will create a file called overclock-cards.sh after identifying your cards and setting up overclock settings
via variables setup on top of the file.

Great for beginners using linux.  You still need to run the followig command to make changes to your xconf.org files

sudo nvidia-xconfig -a --allow-empty-initial-configuration --cool-bits=31 --use-display-device="DFP-0" --connected-monitor="DFP-0"

Tested on ubuntu OS using GeForce cards on 13 slot ASRock H110 BTC+
Geforce 1050 ~ 12.4 Mh/s  1060 ~ 23.4 Mh/s   1070 ~ 31.1 Mh/s with current settings in script
