#!/usr/bin/env bash

set -e

EDITOR=nano

read -s -e -p "Enter op service token: " OP_TOKEN

export OP_SERVICE_ACCOUNT_TOKEN=$OP_TOKEN

op inject -i /etc/containers/docker/komodo/compose.env -o compose.env

run0 mv compose.env /etc/containers/docker/komodo/compose.env

systemctl enable komodo-docker-compose.service
systemctl start komodo-docker-compose.service