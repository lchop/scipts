#!/bin/bash

xterm -hold -e ssh socrob@10.1.15.14 -L 5900:localhost:5900 "x11vnc -display :0 -noxdamage" &

sleep 6
vncviewer localhost::5900
