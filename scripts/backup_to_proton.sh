#!/bin/bash

# get Proton MFA code from KeePassXC
MFACODE=$(keepassxc-cli show -t ~/keys/keepass/Passwords.kdbx /Email/Proton | grep -E -i '[0-9]{6}')

# use rclone to backup home directory to ProtonDrive
#rclone --protondrive-2fa=$MFACODE --protondrive-replace-existing-draft --protondrive-enable-caching sync ~/ remote-proton:sync/cbXX --exclude-from ~/.remote-proton_exclude

rclone --protondrive-2fa=$MFACODE --protondrive-replace-existing-draft sync ~/ remote-proton:sync/cbXX --exclude-from ~/.remote-proton_exclude

