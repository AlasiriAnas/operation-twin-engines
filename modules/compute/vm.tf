resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = var.subnet
  }

  tags = var.tags

  metadata_startup_script = var.startup_script
}