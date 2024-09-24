module "gittea" {
  source = "./qemu_vm"

  ip          = "192.168.7.11"
  target_node = "1"
  vm_name     = "gittea01v"
  disk_size  = "100G"
  memory_size = 1024 * 8
  cpu_cores   = 2
}