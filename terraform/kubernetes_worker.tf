module "kube_worker" {
    count = 6
    source = "./almalinux_vm"

    ip = "192.168.7.2${count.index}"
    target_node = "${count.index % 3 + 1}" // distribute the worker over all three hypervisors
    vm_name = "kube-worker0${count.index + 1 }v"
    disk_size = "100G"
    memory_size = 1024 * 8
    cpu_cores = 4
}