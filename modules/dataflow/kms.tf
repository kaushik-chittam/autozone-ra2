resource "google_kms_key_ring" "main" {
  name     = local.name
  project  = var.project_id
  location = var.region
}

resource "google_kms_crypto_key" "main" {
  name            = local.name
  key_ring        = google_kms_key_ring.main.id
  rotation_period = var.key_rotation_period
}