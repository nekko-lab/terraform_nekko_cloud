# PROXMOX PROVIDER CONFIGURATION
variable "PM_USER" {
  description = "The Proxmox user"
  type        = string
  default     = ""
}


variable "PM_PASS" {
  description = "The Proxmox login password"
  type        = string
  default     = ""
}


variable "PM_API_TOKEN_ID" {
  description = "The Proxmox API Token ID"
  type        = string
  default     = ""
}


variable "PM_API_TOKEN_SECRET" {
  description = "The Proxmox API Token Secret"
  type        = string
  default     = ""
}


variable "PM_TLS_INSECURE" {
  description = "The Proxmox TLS insecure flag"
  type        = bool
  default     = "true"
}


variable "PM_DEBUG" {
  description = "The Proxmox debug flag"
  type        = bool
  default     = "true"
}


variable "PM_LOG_ENABLE" {
  description = "The Proxmox log enable flag"
  type        = bool
  default     = "true"
}


variable "PM_LOG_LEVEL" {
  description = "The Proxmox log level"
  type        = string
  default     = "debug"
}


variable "PM_LOG_FILE" {
  description = "The Proxmox log file"
  type        = string
  default     = "terraform-plugin-proxmox.log"
}


# NEKKO CLOUD PROVIDER CONFIGURATION
variable "NC_REGION" {
  description = "The Nekko Cloud region"
  type        = string
  default     = ""  # Set Proxmox region
}


variable "NC_REGION_IP" {
  description = "The Nekko Cloud region IPv6 address"
  type        = map(string)
  default     = {
    "mkdev"  = "fd12:e644:6d9d:0000::101",
    "mkprob" = "fd12:e644:6d9d:0080::101",
    "urdev"  = "fd12:e644:6d9d:0100::101",
    "urprob" = "fd12:e644:6d9d:0180::101",
    "tudev"  = "fd12:e644:6d9d:0200::101",
    "tuprob" = "fd12:e644:6d9d:0280::101",
    "temp-proxmox-dev1" = "10.1.128.103",
    "temp-proxmox-dev2" = "10.0.128.103"
  }
}


variable "NC_RSC_POOL" {
  description = "The Nekko Cloud resource pool"
  type        = string
  default     = "dev"
}


# VM CONFIGURATION
variable "vm_name" {
  description = "The name of the VM"
  type        = string
  default     = ""
}


variable "vm_br" {
  description = "The bridge to assign to the VM"
  type        = map(string)
  default     = {
    ""     = "vmbr0",
    "dev"  = "vmbr1128",
    "prod" = "vmbr1001"
  }
}


variable "username" {
  description = "The username to assign to the VM"
  type        = string
  default     = ""
}


variable "password" {
  description = "The password to assign to the VM"
  type        = string
  default     = ""
}


variable "public_key" {
  description = "The public key to be used for SSH"
  type        = string
  default     = ""
}

variable "custom_path" {
  description = "The path of cicustom"
  type = string
  default = ""
}