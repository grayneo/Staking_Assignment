provider "your_provider" {
  # Configure your cloud provider (e.g., AWS, Proxmox, etc.)
}

resource "your_vm_resource" "ubuntu_vm" {
  name        = "ubuntu-server"
  image       = "ubuntu-24.04"
  cpu         = 2
  memory      = 4096
  
  network_interface {
    name       = "external_interface"
    type       = "external"
    ip_address = "180.180.180.1"
  }
  
  network_interface {
    name       = "internal_interface"
    type       = "internal"
    vlan_id    = 150
    ip_address = "10.200.16.101"
    netmask    = "255.255.255.248"
  }
}