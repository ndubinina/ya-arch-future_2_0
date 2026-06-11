terraform {

  backend "s3" {
    endpoint = "storage.yandexcloud.net"

    bucket = "future20-tfstate"
    key    = "dev/terraform.tfstate"

    region = "ru-central1"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
  }

  required_version = ">= 1.5"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.130"
    }
  }
}


provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "vm" {
  source = "../../../Task1Advanced/modules/vm"

  vm_name   = var.vm_name
  cores     = var.cores
  memory    = var.memory
  disk_size = var.disk_size
  disk_type = var.disk_type
  image_family  = var.image_family
  subnet_id = var.subnet_id
  ssh_user  = var.ssh_user
  ssh_key   = var.ssh_key
}