Due to a limitation of the proxmox API this bootstrap which uses the kvm_args feature of the bpg/proxmxo provider needs to authenticate with password auth.
This means 2fa on proxmox must be disabled.
It is recommended to just leave 2fa off during the bootstrap and enabling it immediately after.