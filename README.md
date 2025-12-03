# Simen's homelab

This is the repo containing code and configs for my homelab with a focus on IaC and GitOps.

## Hardware

I currently use an old gaming PC for proxmox, an old HP workstation for OPNsense, a raspberry pi for Home Assistant, and a VPS from hetzner for headscale. I am also setting up two workstations to use as a k8s cluster.  
(Pictures and specs coming)

## Software

| Logo                                                                                                 | Name                                                                       | Description                         |
|:------------------------------------------------------------------------------------------------:|-----------------------------------------------------------------------|-------------------------|
| <img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/png/nextcloud.png">               | [Nextcloud](https://nextcloud.com/)                                   | File Storage / Syncing  |
| <img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/png/home-assistant.png">          | [Home Assistant](https://www.home-assistant.io/)                      | Smart home              |

Nextcloud runs in a vm on my proxmox node, home assistant on a pi, and headscale on my Hetzner VPS.  

## Tech stack

My tech stack focuses on IaC and GitOps while being modern, easy to maintain and fun to work while teaching me about DevOps

### Virtualization

| Logo                                                                                                                                         | Name                                                                      | Description                                                                        |
|:--------------------------------------------------------------------------------------------------------------------------------------------:|---------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| <img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/png/proxmox.png">                                                                       | [Proxmox VE](https://www.proxmox.com/en/proxmox-virtual-environment/)     | Open-source virtualization platform based on KVM                                   |

### IaC & GitOps

|                                       Logo                                        | Name                                                                          | Description                                                           |
| :-------------------------------------------------------------------------------: | ----------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| <img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/png/opentofu.png"> | [OpenTofu](https://opentofu.org/)                                             | Tool for declaratively managing infrastructure and cloud resources    |
|  <img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/svg/podman.svg">  | [Podman](https://podman.io/)                                                  | Building images that declaratively defines an OS using containerfiles |
<img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/webp/docker.webp"> | [Docker](https://www.docker.com/) | Running my containarized applications like komo.do
| <img width="32" src="https://avatars.githubusercontent.com/u/3730757?s=280&v=4">  |[Ignition](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign/) | Config file for configuring / rebasing a Fedora CoreOS install        |
|  <img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/svg/komodo.svg">  | [Komodo](https://komo.do/)                                                    | Deploys docker compose files pulled from a git repo                   |

### Operating systems

| Logo                                                                             | Name                                               | Description                                                                      |
| -------------------------------------------------------------------------------- | -------------------------------------------------- | -------------------------------------------------------------------------------- |
| <img width="32" src="https://avatars.githubusercontent.com/u/13804887">          | [Talos Linux](https://www.talos.dev/)              | Minimal, immutable, API driven Linux distribution designed for Kubernetes        |
| <img width="32" src="https://avatars.githubusercontent.com/u/3730757?s=280&v=4"> | [Fedora CoreOS](https://fedoraproject.org/coreos/) | Immutable OS built for servers, using it as a base before rebasing with ignition |
| <img width="32" src="https://secureblue.dev/assets/icons/favicon.svg">           | [Securecore](https://secureblue.dev/)              | A security-focused server linux operating system                                 |

### Networking

| Logo                                                                                                                             | Name                                                                                                                                | Description                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| <img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/png/opnsense.png">                                                | [OPNsense](https://opnsense.org/)                                                                                                   | Open source firewall and router                                                              |
| <img width="32" src="https://play-lh.googleusercontent.com/Hyedd-vjRpgJHAVdth6SkLaAKyxT_qJvRCzNYFX7qQ-IRZZihygR-29IWlcXORvBmN4"> | [Asus ET12](https://www.asus.com/no/networking-iot-servers/whole-home-mesh-wifi-system/zenwifi-wifi-systems/asus-zenwifi-pro-et12/) | Asus router being used in AP mode                                                            |
| <img width="32" src="https://cdn.jsdelivr.net/gh/selfhst/icons/png/tailscale-light.png">                                         | [Tailscale](https://tailscale.com/)                                                                                                 | Overlay VPN with self-hosted control server using [Headscale](https://headscale.net/stable/) |

<br>
<hr>
<p align="center" style="font-size: small; color: gray;">
  Thanks to <a href="https://github.com/olav-st/" target="_blank">Olav S. Thoresen
</a> for this great homelab README format
</p>
