variable "proxmox_host" {
    default = "pve"
}
variable "template" {
    default = "ubuntu-tf-template"
}
variable "nic" {
    default = "vmbr0"
}
variable "api_url" {
    default = "https://192.168.100.100:8006/api2/json"
}
variable "token_secret" {
}
variable "token_id" {
}
