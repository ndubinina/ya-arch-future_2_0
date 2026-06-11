variable "vm_name" {
  type = string
}

variable "cores" {
  type = number
  default = 2
}

variable "memory" {
  type = number
  default = 2
}

variable "disk_size" {
  type = number
  default = 15
}

variable "disk_type" {
  type = string
  default = "network-ssd"
}

variable "image_family" {
  type = string
  default = "ubuntu-2204-lts"
}

variable "subnet_id" {
  type = string
}

variable "ssh_user" {
  type = string
  default = "ubuntu"
}

variable "ssh_key" {
  type = string
}