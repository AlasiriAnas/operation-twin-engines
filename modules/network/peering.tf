resource "google_compute_network_peering" "frontend_to_backend" {
  name         = "frontend-to-backend"
  network      = google_compute_network.frontend.self_link
  peer_network = google_compute_network.backend.self_link
}

resource "google_compute_network_peering" "backend_to_frontend" {
  name         = "backend-to-frontend"
  network      = google_compute_network.backend.self_link
  peer_network = google_compute_network.frontend.self_link
}