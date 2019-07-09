#!/bin/bash

## installing docker
sudo pacman -S docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo groupadd docker 
sudo gpasswd -a $USER docker
