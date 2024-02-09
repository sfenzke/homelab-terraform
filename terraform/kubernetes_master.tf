module "kube_master" {
    count = 3
    source = "./almalinux_vm"

    ip = "192.168.7.1${count.index}"
    target_node = "${count.index + 1 }"
    vm_name = "kube-master0${count.index + 1 }v"
    disk_size = "100G"
    memory_size = 1024 * 8
    cpu_cores = 4
}