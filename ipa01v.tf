module "ipa" {
  source = "./qemu_vm"

  ip          = "192.168.7.10"
  target_node = "1"
  vm_name     = "ipa01v.local.sfenzke.de"
  disk_size   = "50G"
  template    = "rhel9.4-ci"
  memory_size = 1024 * 4
  cpu_cores   = 2
}