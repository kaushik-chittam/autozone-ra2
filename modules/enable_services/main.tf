# Enable services in newly created GCP Project.
resource "google_project_service" "gcp_services" {
  count   = length(var.gcp_service_list)
  project = var.project_id
  service = var.gcp_service_list[count.index]

  disable_dependent_services = true
}

resource "time_sleep" "api-sleep" {
  depends_on = [
    google_project_service.gcp_services
  ]
  create_duration = "1m"
}