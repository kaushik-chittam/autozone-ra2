variable "project_id" {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = ""
}

variable "environment" {
  description = "Name of the Environment"
  type        = string
}

variable "topic_name" {
  description = "The name of the Pub Sub topic."
  default     = ""
  type        = string
}

variable "allowed_persistance_regions" {
  description = "A list of IDs of GCP regions where messages that are published to the topic may be persisted in storage"
  type        = list(any)
  default     = []
}

variable "schema" {
  description = "The name of the schema that messages published should be validated against. Format is projects/{project}/schemas/{schema}"
  type        = string
  default     = "projects/{project}/schemas/{schema}" #change this
}

variable "encoding" {
  description = "The encoding of messages validated against schema"
  type        = string
  default     = "ENCODING_UNSPECIFIED"
}

variable "message_retention_duration" {
  description = "Indicates the minimum duration to retain a message after it is published to the topic."
  type        = string
  default     = "604800s"
}

variable "gcp_az_labels" {
  description = "Required labels for AutoZone"
  type = object({
    tag_version = string
    app_name    = string
    env         = string
  })

  default = {
    app_name    = "autzone-example"
    env         = "dev"
    tag_version = "2022-06-15"
  }
}

variable "labels" {
  description = "A map of key/value pairs to assign to all resources in this root-module."
  type        = map(string)
  default     = {}
}

variable "subscription_details" {
  description = "Subscription details"
  type = map(object({
    service_account_email = string
    audience              = string
    push_endpoint         = string
    //attributes                   = map(string)
    filter                       = string
    dead_letter_topic            = string
    max_delivery_attempts        = number
    minimum_backoff              = string
    maximum_backoff              = string
    ttl                          = string
    enable_exactly_once_delivery = bool
    enable_message_ordering      = bool
    retain_acked_messages        = bool
    ack_deadline_seconds         = number
  }))
  /*
  default = {

    service_account_email        = ""
    audience                     = ""
    push_endpoint                = ""
    attributes                   = ""
    filter                       = ""
    dead_letter_topic            = ""
    max_delivery_attempts        = 5
    minimum_backoff              = "10s"
    maximum_backoff              = "600s"
    ttl                          = ""
    enable_exactly_once_delivery = false
    enable_message_ordering      = false
    retain_acked_messages        = true
    ack_deadline_seconds         = 20

        service_account_email        = string
    audience                     = string)
    push_endpoint                = string
    attributes                   = string)
    filter                       = string)
    dead_letter_topic            = string)
    max_delivery_attempts        = number)
    minimum_backoff              = string)
    maximum_backoff              = string)
    ttl                          = string
    enable_exactly_once_delivery = bool)
    enable_message_ordering      = bool)
    retain_acked_messages        = bool)
    ack_deadline_seconds         = number)
  }*/
}
