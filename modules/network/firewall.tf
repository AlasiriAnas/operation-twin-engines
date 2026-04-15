# Allow SSH to both VMs
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.frontend.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "allow_http_frontend" {
  name    = "allow-http-frontend"
  network = google_compute_network.frontend.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["frontend"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_backend_api" {
  name    = "allow-backend-api"
  network = google_compute_network.backend.name

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }

  target_tags   = ["backend"]
  source_ranges = ["10.0.0.0/16"]
}