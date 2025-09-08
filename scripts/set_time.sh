#!/bin/bash

read -p "What is the current datetime in YYYY-MM-DD HH:mm:ss?>" newdt

sudo timedatectl set-time '$newdt'

sudo hwclock --systohc

timedatectl

