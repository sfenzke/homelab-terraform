terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "2.9.14"
        }
    }
}

resource "proxmox_vm_qemu" "almalinux_vm" {
        name = "${var.vm_name}"
        desc = "AlmaLinux-Server"
        target_node = "pve0${var.target_node}"
        sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRju8MB/kGJeA+XRj9JEEklMKWdt4+u/BDWVe7/kuEXCjHcIRbE7Nf4j2QNsH1Gmqcd4SjjAvkNTcKlvI2/CFed2SHr/7zLEe8tBUZzY3mhGoj9A9WtluJw3l+Qrh0q/sDuNefd2paewDFfuyVoQCjc9DQZu47fcFMNBJj8qcQEM96CyB6NwVtCvycrrqc/9h3zeG7Q5+pOKlQ2kHhSHO0UYMu76kjNjapU8RvsZvPRFmlCCSB2eXtV3VaiddguF5+HbNjul1PtVomzVQIa0eKg0JuPmiROoL+7rXjNYoZWPqQQXCgmuIWjZ1ghNONoBqNWZ7sCKatJjI27Teg2msF94Y+1/EAQZkOGc+ZxhVj3foIM1oATBMce1t0pXHR8aJ12G+R7CILFzshu32FOqD4RHjNB701wdbuAeMeqdqG+BqBWke1LzKPDHztGHtY8oJLFrOBRO3nwsLMDK+ZoZRDdDv8s3pK2Any+Ivpqiby1z4H5a9S0uvws0DBOwaiAQs="
        agent = 1
        clone = "almalinux9.3-ci"
        qemu_os = "l26"
        # this l26 is a small l like linux
        cores = "${var.cpu_cores}"
        sockets = 1
        cpu = "host"
        memory = "${var.memory_size}"
        scsihw = "virtio-scsi-pci"

        vga {
                type = "std"
        }

        disk {
                storage = "vm_disks"
                type = "scsi"
                size = "${var.disk_size}"
                discard = "on"
                ssd = "1"
        }

        network {
                bridge = "vmbr0"
                model = "virtio"
        }

        ## muss dem Template matchen

        os_type = "cloud-init"
        ipconfig0 = "ip=${var.ip}/24,gw=192.168.7.1"
        nameserver = "192.168.6.2"
        ciuser = "tk"
}