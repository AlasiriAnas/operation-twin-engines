output "frontend_subnet" {
  value = google_compute_subnetwork.frontend_subnet.self_link
}

output "backend_subnet" {
  value = google_compute_subnetwork.backend_subnet.self_link
}