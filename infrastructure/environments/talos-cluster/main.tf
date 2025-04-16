module "proxmox-talos-vms" {
    source = "../../modules/proxmox-talos-vms"

    control_plane_vms = var.control_plane_vms
    worker_vms = var.worker_vms
    default_gateway = var.default_gateway
    dns_ip = var.dns_ip
    dns_search_domain = var.dns_search_domain
    proxmox_ve_api_token = var.proxmox_ve_api_token
    proxmox_endpoint = var.proxmox_endpoint
    proxmox_ssh_key = var.proxmox_ssh_key
}

module "proxmox-talos-firewall-rules" {
  source = "../../modules/proxmox-talos-firewall-rules"

  depends_on = [ module.proxmox-talos-vms ]

  control_plane_vms = var.control_plane_vms
  worker_vms = var.worker_vms
  node_name = var.node_name
  proxmox_ve_api_token = var.proxmox_ve_api_token
  proxmox_endpoint = var.proxmox_endpoint
  proxmox_ssh_key = var.proxmox_ssh_key
}

module "control-plane-dns" {
  source = "../../modules/control-plane-dns"

  depends_on = [
    module.proxmox-talos-vms
  ]

  control_plane_vms = var.control_plane_vms
  worker_vms = var.worker_vms
  nextdns_profile_id = var.nextdns_profile_id
  control_plane_url = var.control_plane_url
  nextdns_api_key = var.nextdns_api_key
}

module "talos-bootstrap" {
  depends_on = [ 
    module.proxmox-talos-vms,
    module.control-plane-dns,
    module.proxmox-talos-firewall-rules
   ]

  source = "../../modules/talos-bootstrap"

  control_plane_vms = var.control_plane_vms
  worker_vms = var.worker_vms
  default_gateway = var.default_gateway
  control_plane_url = var.control_plane_url
  cluster_name = var.cluster_name
  install_disk = var.install_disk
  
}