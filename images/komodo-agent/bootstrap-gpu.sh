#!/usr/bin/env bash

set -e

EDITOR=nano

sudo systemctl enable tailscaled
sudo systemctl start tailscaled
sudo tailscale set --operator=$USER

read -s -e -p "Enter tailscale preauth key: " AUTH_KEY

tailscale up --login-server=https://vpn.simenmo.com --authkey ${AUTH_KEY} --accept-dns=false

read -s -e -p "Enter op service token: " OP_TOKEN

export OP_SERVICE_ACCOUNT_TOKEN=$OP_TOKEN

op inject -i /etc/containers/docker/komodo-periphery/compose.env -o compose.env

sudo mv compose.env /etc/containers/docker/komodo-periphery/compose.env

sudo systemctl enable komodo-periphery-docker-compose.service
sudo systemctl start komodo-periphery-docker-compose.service

sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
