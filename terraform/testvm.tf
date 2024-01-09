module "almalinux_vm" {
    source = "./almalinux_vm"

    ip = "192.168.7.2"
    target_node = 1
    vm_name = "testvm"
    disk_size = "80G"
    memory_size = 4096
    cpu_cores = 1
}