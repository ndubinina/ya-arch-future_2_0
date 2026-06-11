data "yandex_compute_image" "image" {
  family = var.image_family
}

resource "yandex_compute_disk" "vm_disk" {
  name = "${var.vm_name}-disk"
  type = var.disk_type
  image_id = data.yandex_compute_image.image.image_id
  size = var.disk_size
}

resource "yandex_compute_instance" "vm" {
  name = var.vm_name

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.vm_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  }
}