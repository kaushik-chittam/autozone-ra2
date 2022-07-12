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
  for_each = var.subscription_details
  project  = var.project_id
  name     = lower("${each.key}-${var.environment}")
  topic    = google_pubsub_topic.pubsub_topic.name
  labels   = local.labels
  expiration_policy {
    ttl = each.value.ttl
  }
  push_config {
    oidc_token {
      service_account_email = each.value.service_account_email
      audience              = each.value.audience
    }
    push_endpoint = each.value.push_endpoint
    //attributes    = each.value.attributes
  }
  filter = each.value.filter
  /*
  dead_letter_policy {
    dead_letter_topic     = each.value.dead_letter_topic
    max_delivery_attempts = each.value.max_delivery_attempts
  }*/
  retry_policy {
    minimum_backoff = each.value.minimum_backoff
    maximum_backoff = each.value.maximum_backoff
  }
  enable_exactly_once_delivery = each.value.enable_exactly_once_delivery
  enable_message_ordering      = each.value.enable_message_ordering

  message_retention_duration = var.message_retention_duration
  retain_acked_messages      = each.value.retain_acked_messages
  ack_deadline_seconds       = each.value.ack_deadline_seconds
}
