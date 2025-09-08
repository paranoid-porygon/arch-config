#!/bin/bash
TORCMD="tor --defaults-torrc /usr/share/tor/tor-service-defaults-torrc -f /etc/tor/torrc --RunAsDaemon 1"
sudo -b daemon -f -d -- firejail --profile=/home/paranoidporygon/.config/firejail/tor.profile $TORCMD
