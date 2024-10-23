module "kubernetes" {
  source = "./qemu_vm"
  count = 3

  ip          = "192.168.7.2${count.index}"
  target_node = "${count.index + 1}"
  vm_name     = "kube0${count.index + 1}"
  disk_size  = "50G"
  memory_size = 1024 * 4
  cpu_cores   = 2
}