module "jenkins" {
  source = "./qemu_vm"

  ip          = "192.168.7.12"
  target_node = "2"
  vm_name     = "jenkins01v"
  disk_size  = "100G"
  memory_size = 1024 * 8
  cpu_cores   = 2
}