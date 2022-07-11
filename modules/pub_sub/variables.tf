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

variable "subscription_name" {
  description = "The name of the Pub Sub subscription."
  type        = string
}

variable "service_account_email" {
  description = "Service account email to be used for generating the OIDC token"
  type        = string
  default     = ""
}

variable "audience" {
  description = "Audience to be used when generating OIDC token."
  type        = string
  default     = ""
}

variable "push_endpoint" {
  description = "A URL locating the endpoint to which messages should be pushed."
  type        = string
  default     = ""
}

variable "attributes" {
  description = "Every endpoint has a set of API supported attributes that can be used to control different aspects of the message delivery."
  type        = map(any)
  default = {
    "something" = "something"
  }
}

variable "filter" {
  description = "The subscription only delivers the messages that match the filter."
  type        = string
  default     = ""
}

variable "dead_letter_topic" {
  description = "The name of the topic to which dead letter messages should be published. Format is 'projects/{project}/topics/{topic}'."
  type        = string
  default     = ""
}

variable "max_delivery_attempts" {
  description = "The maximum number of delivery attempts for any message. The value must be between 5 and 100."
  type        = number
  default     = 5
}

variable "minimum_backoff" {
  description = "The minimum delay between consecutive deliveries of a given message."
  type        = string
  default     = ""
}

variable "maximum_backoff" {
  description = "The maximum delay between consecutive deliveries of a given message."
  type        = string
  default     = ""
}

variable "enable_message_ordering" {
  description = "If 'true', messages published with the same orderingKey in PubsubMessage will be delivered to the subscribers in the order in which they are received by the Pub/Sub system."
  type        = bool
  default     = false
}

variable "retain_acked_messages" {
  description = "Indicates whether to retain acknowledged messages. If 'true', then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window."
  type        = bool
  default     = false
}

variable "message_retention_duration" {
  description = "Indicates the minimum duration to retain a message after it is published to the topic."
  type        = string
  default     = "604800s"
}

variable "ack_deadline_seconds" {
  description = "This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message. "
  type        = number
  default     = 10
}

variable "enable_exactly_once_delivery" {
  description = "If 'true', Pub/Sub provides the following guarantees for the delivery of a message with a given value of messageId on this Subscriptions"
  type        = bool
  default     = false
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

variable "ttl" {
  description = "Specifies the 'time-to-live' duration for an associated resource."
  type        = string
  default     = "5s"
}
