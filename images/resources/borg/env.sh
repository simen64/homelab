#!/bin/sh
export BORG_REPO='borg@backup.server:/path/to/repository'
export BORG_BASE_DIR=/backup
export BORG_PASSPHRASE="a randomly generated password unique for every system"
export BORG_RSH='ssh -i /backup/system-name-ssh-key'
