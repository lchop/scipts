#!/bin/bash

# modify here for the name of your robot (mbot05 -> 85-mbot, mbot07 -> 80-mbot)
UDEV_FILENAME=85-mbot

# inform user which rules are going to be installed
if [ "$UDEV_FILENAME" == "85-mbot" ]; then
  echo 'Installing udev rules for mbot05 robot'
elif [ "$UDEV_FILENAME" == "80-mbot" ]; then
  echo 'Installing udev rules for mbot07 robot'
fi

# get username from environment variable USER
USERNAME=`echo $USER`

# add socrob use to dialout group, you can confirm this command by executing: "groups socrob"
echo "executing : sudo usermod -a -G dialout ${USERNAME}"
sudo usermod -a -G dialout ${USERNAME}

# copy udev rules to udev directory
echo "executing : sudo cp ${UDEV_FILENAME}.rules /etc/udev/rules.d"
sudo cp ${UDEV_FILENAME}.rules /etc/udev/rules.d

# restart udev for the rules to take effect
echo "executing : sudo service udev restart"
sudo service udev restart
