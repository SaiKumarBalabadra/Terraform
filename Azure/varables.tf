variable "vnet_name" {
    description = "name of vnet"
    default = "myVNet"
}

variable "vm_name" {
    description = "The name of vm"
    default = "myVm"
}

variable "vm_size" {
    description = "size of vm"
    default = "Standard_DS1_v2"
}

variable "admin_username" {
    description = "admin username of vm"
    default = "adminuser"
}

variable "admin_password" {
    description = "admin password for vm"
    default = "Password@123"
}