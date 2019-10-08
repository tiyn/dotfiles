#!/bin/sh

sudo pacman -S thinkfan lm_sensors
sudo modprobe thinkpad_acpi
sudo cp /usr/share/doc/thinkfan/examples/thinkfan.conf.simple /etc/thinkfan.conf
systemctl enable thinkfan
