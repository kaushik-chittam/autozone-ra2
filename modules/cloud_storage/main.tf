resource "google_storage_bucket" "storage_bucket" {
  name          = var.name
  location      = var.region
  storage_class = "REGIONAL"
  project       = var.project_id
  force_destroy = var.force_destroy
}