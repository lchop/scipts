#!/bin/bash

# Test if a command outputs an empty string
if [[ $(which nvidia-smi) ]]; then
    echo "gpu detected, limiting power consumption to 80 Watts"
    sudo nvidia-smi -pm 1
    sudo nvidia-smi -pl 80
else
    echo "gpu not found, all ok!"
fi
