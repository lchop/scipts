#!/bin/bash

echo 'Recording Video from "/head_camera/rgb/image_rect_color/" to ~/test/output.avi'

rosrun image_view video_recorder image:=/head_camera/rgb/image_rect_color/ _filename:=$HOME/test/output.avi _fps:=30 _codec:=MJPG

echo 'Video successfully captured!'
