resource "google_cloud_run_service" "main" {
  name     = var.cloud_run_service_name
  location = var.region
  project  = var.project_id

  template {
    metadata {
      annotations = {
        "run.googleapis.com/vpc-access-connector" = var.cloud_run_service_config.vpc_access_connector_name
        "run.googleapis.com/vpc-access-egress"    = "all-traffic"
        "autoscaling.knative.dev/maxScale"        = "${var.cloud_run_service_config.max_instances}",
      }
    }
    spec {
      containers {
        image = var.cloud_run_service_config.container_image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

}