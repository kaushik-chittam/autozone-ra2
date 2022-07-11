locals {
  labels = merge(var.labels, var.gcp_az_labels)
}

resource "google_pubsub_topic" "pubsub_topic" {
  project                    = var.project_id
  name                       = lower("${var.topic_name}-${var.environment}")
  message_retention_duration = var.message_retention_duration
  labels                     = local.labels
  /*
  message_storage_policy {
    allowed_persistance_regions = var.allowed_persistance_regions
  }
  schema_settings {
    schema = var.schema
    encoding = var.encoding
  }
  */
}


resource "google_pubsub_subscription" "pubsub_pull_subscription" {
  project = var.project_id
  name    = lower("${var.subscription_name}-${var.environment}")
  topic   = google_pubsub_topic.pubsub_topic.name
  labels  = local.labels
  expiration_policy {
    ttl = var.ttl
  }
  push_config {
    oidc_token {
      service_account_email = var.service_account_email
      audience              = var.audience
    }
    push_endpoint = var.push_endpoint
    attributes    = var.attributes
  }
  filter = var.filter
  dead_letter_policy {
    dead_letter_topic     = var.dead_letter_topic
    max_delivery_attempts = var.max_delivery_attempts
  }
  retry_policy {
    minimum_backoff = var.minimum_backoff
    maximum_backoff = var.maximum_backoff
  }
  enable_exactly_once_delivery = var.enable_exactly_once_delivery
  enable_message_ordering = var.enable_message_ordering
  
  message_retention_duration = var.message_retention_duration
  retain_acked_messages      = var.retain_acked_messages
  ack_deadline_seconds       = var.ack_deadline_seconds
}

resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "service-${var.project_number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}