module "gittea" {
    source = "./almalinux_vm"

    ip = "192.168.7.10"
    target_node = "1"
    vm_name = "gittea01v"
    disk_size = "100G"
    memory_size = 1024 * 8
    cpu_cores = 2
}