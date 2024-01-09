variable "ip" {
    description = "The IP of the system"
    type = string
}

variable "target_node" {
    description = "The node on which the VM should be running"
    type = number
}

variable "vm_name" {
    description = "The Name of the VM"
    type = string
}

variable "disk_size" {
    description = "Size of the new disk"
    type = string
}

variable "memory_size" {
    description = "Size of the memory of the vm"
    type = number
}

variable "cpu_cores" {
    description = "amount of assigned cpu cores"
    type = number
}