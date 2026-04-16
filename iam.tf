resource "google_project_iam_member" "student_access" {
  project = var.project_id
  role    = "roles/owner"

  member  = "user:${var.user_email}"
}