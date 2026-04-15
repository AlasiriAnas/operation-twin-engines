resource "google_compute_network" "frontend" {
  name                    = "vpc-frontend"
  auto_create_subnetworks = false
}

resource "google_compute_network" "backend" {
  name                    = "vpc-backend"
  auto_create_subnetworks = false
}