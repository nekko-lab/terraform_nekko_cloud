# locals: Argument reference
locals {
  target_node   = var.NC_REGION        # Proxmox node
  boot          = "order=scsi0;ide2"   # Boot order
  bootdisk      = "scsi0, ide2"        # Boot disk
  os_type       = "cloud-init"         # OS type
  cputype       = "host"               # CPU type
  scsi_ctl_type = "virtio-scsi-single" # SCSI controller type
  storage_pool  = "local-lvm"          # cephfs local-nvme local-lvmg
  qemu_agent    = 1                    # QEMU agent
}

# locals: VM configuration
locals {
  os_name     = "ubuntu"
  ci_name     = "dev-${local.os_name}-template"
  description = "Ubuntu 22.04 server VM on Proxmox VE, ${var.NC_REGION} region by Terraform"
  clone_num   = 3
  cores       = 2
  memory      = 4096
  balloon     = 1024
  disk_size   = "32G"
  sockets     = 1
  ip_add_net  = var.NC_REGION_IP["${var.NC_REGION}${var.NC_RSC_POOL}"]
  vmbr_num    = var.vm_br[var.NC_RSC_POOL]

  #If you want to use a static IP address, uncomment the following line and comment the above line.
  # network_num = 100
}

# provider: Telmate Proxmox
terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }

  backend "local" {}
}

# provider: Telmate Proxmox
provider "proxmox" {
  pm_api_url          = "https://[${local.ip_add_net}]:8006/api2/json"
  pm_api_token_id     = var.PM_API_TOKEN_ID
  pm_api_token_secret = var.PM_API_TOKEN_SECRET
  pm_tls_insecure     = var.PM_TLS_INSECURE
  pm_debug            = var.PM_DEBUG
  pm_log_enable       = var.PM_LOG_ENABLE
  pm_log_file         = var.PM_LOG_FILE
  pm_log_levels = {
    default = "debug"
    # _capturelog = ""
  }
}
