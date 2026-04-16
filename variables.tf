variable "project_id" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "user_email" {
  description = "User email to grant IAM role"
  type        = string
}