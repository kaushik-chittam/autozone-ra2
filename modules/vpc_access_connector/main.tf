locals {
  labels = merge(var.labels, var.gcp_az_labels)
}

resource "google_vpc_access_connector" "main" {
  provider = google-beta
  project  = var.project_id
  # name must be unique and match ^[a-z][-a-z0-9]{0,23}[a-z0-9]$
  name           = var.name
  region         = var.region
  machine_type   = var.serverless_vpc_connector_config.machine_type
  max_throughput = var.serverless_vpc_connector_config.max_throughput
  min_throughput = var.serverless_vpc_connector_config.min_throughput

  subnet {
    name       = var.subnetwork_name
    project_id = var.network_project_id
  }
}