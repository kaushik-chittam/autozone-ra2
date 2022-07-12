locals {
  labels = merge(var.labels, var.gcp_az_labels)
}

# Create an Eventarc trigger routing Pub/Sub events to Workflows
resource "google_eventarc_trigger" "trigger" {
  name            = var.trigger_name
  location        = var.location
  project         = var.project_id
  service_account = var.service_account
  matching_criteria {
    attribute = "type"
    value     = var.value
    operator  = "" #change
  }
  destination {
    workflow = var.workflow
    /*
        cloud_run_service {
            path = var.path
            service = var.cloud_run_service_url
            region = var.region
        }
        cloud_function = var.cloud_function_url
        gke = {
            cluster = var.cluster
            location = var.region
            path = var.path
            service = var.service
            namespace = var.namespace
        }
    */
  }
  /*
  transport {
    pubsub = {
      subscription = var.subscription
      topic        = var.topic
    }
  }
  */
}