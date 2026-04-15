resource "google_compute_subnetwork" "frontend_subnet" {
  name          = "frontend-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.frontend.id
}

resource "google_compute_subnetwork" "backend_subnet" {
  name          = "backend-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.backend.id
}