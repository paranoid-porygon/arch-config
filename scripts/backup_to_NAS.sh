#!/bin/bash

# Backup script to sync files to local NAS
#
# Each folder that needs to be backed up will be a separate call to rclone.
# If this performs poorly, make a single call with an exclusion list.

# on first run on a new machine, enable resync and dry run. on second run, just resync. after that, disable resync unless an issue comes up.
rclone bisync ~/vimwiki/ /mnt/NAS/vimwiki/ --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --fix-case #--resync #--verbose --dry-run
