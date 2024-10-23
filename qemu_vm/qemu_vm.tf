terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "2.9.14"
        }
    }
}

resource "proxmox_vm_qemu" "qemu_vm" {
        name = "${var.vm_name}"
        desc = "${var.description}"
        target_node = "pve0${var.target_node}"
        sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCNHLe3/XOXcNKShXpHo2r5aeBBs/jr4GoNvdjkfrT1PhywYKZSA1l5Wu9KwvkYl0K80hjaCWXXTpIy7T9ggIpIEpxJmPz1NvWxXronYCf32VTRrnfLjIxKHg03mx9XFEn4lGa+H8Kpd2Uf4qQr47xOPFW8cuSLt06bSPl22J0wy7Y3ZemJkHweTY4tJnye06a+s6fcUb8UOkz5B5eySj8fnyR0uMfnVtjlJgT2QBUYvdmGpqfPZvvuMuiD0yIR5E4jp/ZUIcVm/3KQQxGZXUbBiK2deFnXSGZKVl+o9dPIrt6muho8IcN2s3H6WznY5GxJyu5QKVj4tqCpwU84EmTnfQZCOv6cQNSeMgwWjxmqT5VCuU2aXHyVgust7Ccg1IyDQh9XTUay1cw2ctWGbF4WeF59S6CRr/TQ7GTxWob275X2O+LZbzcqBBiu+8JkUzcNhd9Z1kYR+pt2NC2Bk7QBhc/209mFAu5rQH5MDuf5qHXFZ0MUGSX4qUyHcsgQUkc="
        agent = 1
        ## muss dem Template matchen
        clone = "${var.template}"
        # this l26 is a small l like linux
        qemu_os = "l26"
        cores = "${var.cpu_cores}"
        sockets = 1
        cpu = "host"
        memory = "${var.memory_size}"
        scsihw = "virtio-scsi-pci"

        vga {
                type = "std"
        }

        disks {
                scsi {
                        scsi0 {
                                disk {
                                        storage = "vm_disks"
                                        size = "${var.disk_size}"
                                }
                        }

                }
                ide {
                        ide2 {
                                cloudinit {
                                        storage = "vm_disks"
                                }
                        }
                }
        } 

        network {
                bridge = "vmbr0"
                model = "virtio"
        }


        os_type = "cloud-init"
        ipconfig0 = "ip=${var.ip}/24,gw=192.168.7.1"
        nameserver = "192.168.7.2"
        ciuser = "ansible"
        boot = "order=scsi0;ide2"
}