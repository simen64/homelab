module "proxmox-talos-vms" {
    source = "../../modules/kubernetes/proxmox-talos-vms"

    control_plane_vms = var.control_plane_vms
    worker_vms = var.worker_vms
    default_gateway = var.default_gateway
    dns_ip = var.dns_ip
    dns_search_domain = var.dns_search_domain
    proxmox_ve_api_token = var.proxmox_ve_api_token
    proxmox_endpoint = var.proxmox_endpoint
    proxmox_ssh_key = var.proxmox_ssh_key
    file_id = proxmox_virtual_environment_download_file.talos_nocloud_image.id
}

module "proxmox-talos-firewall-rules" {
  source = "../../modules/kubernetes/proxmox-talos-firewall-rules"

  depends_on = [ module.proxmox-talos-vms ]

  control_plane_vms = var.control_plane_vms
  worker_vms = var.worker_vms
  node_name = var.node_name
  proxmox_ve_api_token = var.proxmox_ve_api_token
  proxmox_endpoint = var.proxmox_endpoint
  proxmox_ssh_key = var.proxmox_ssh_key
}

module "control-plane-dns" {
  source = "../../modules/kubernetes/control-plane-vm-dns"

  depends_on = [
    module.proxmox-talos-vms
  ]

  control_plane_vms = var.control_plane_vms
  worker_vms = var.worker_vms
  control_plane_url = var.control_plane_url
  control_plane_host = var.control_plane_host
  opnsense_api_key = var.opnsense_api_key
  opnsense_api_secret = var.opnsense_api_secret
  opnsense_uri = var.opnsense_uri
  opnsense_ip = var.default_gateway
}

module "talos-bootstrap" {
  depends_on = [ 
    module.proxmox-talos-vms,
    module.control-plane-dns,
    module.proxmox-talos-firewall-rules
   ]

  source = "../../modules/kubernetes/talos-vm-bootstrap"

  control_plane_vms = var.control_plane_vms
  worker_vms = var.worker_vms
  default_gateway = var.default_gateway
  control_plane_url = var.control_plane_url
  cluster_name = var.cluster_name
  install_disk = var.install_disk
  
}
