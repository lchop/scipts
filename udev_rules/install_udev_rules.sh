#!/bin/bash

# copy udev rules to udev directory
echo "executing : sudo cp 99-mbot.rules /etc/udev/rules.d"
sudo cp 99-mbot.rules /etc/udev/rules.d

# restart udev for the rules to take effect
echo "executing : sudo service udev restart"
sudo service udev restart
