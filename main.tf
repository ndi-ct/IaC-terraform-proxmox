terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}
provider "proxmox" {
  pm_api_url = var.api_url
  pm_api_token_id = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure = true
  }
resource "proxmox_vm_qemu" "cttest" {
  name = "test-vm-${count.index + 1}"
  count = 3
  target_node = var.proxmox_host
  clone = var.template
  full_clone  = "true"
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "20G"
    type = "scsi"
    storage = "local-lvm"
    discard = "on"
  }

  network {
    model = "virtio"
    bridge = var.nic
  }
#  provisioner "local-exec" {
#    command = "echo ${self.name}: ${self.default_ipv4_address} >> ipv4list.txt"
#  }
}
