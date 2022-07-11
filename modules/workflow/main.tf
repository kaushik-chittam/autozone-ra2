locals {
  labels = merge(var.labels, var.gcp_az_labels)
}

resource "google_service_account" "workflows_service_account" {
  account_id   = var.account_id
  display_name = var.display_name
}

resource "google_workflows_workflow" "workflow_job" {
  name            = var.workflow_name
  region          = var.region
  project         = var.project_id
  description     = var.description
  service_account = google_service_account.workflows_service_account.id
  labels          = local.labels
  #name_prefix     = var.name_prefix
  source_contents = var.source_contents
}