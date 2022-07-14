variable "project_id" {
  description = "Name of the Project"
  type        = string
}

variable "trigger_name" {
  description = "The name of the Trigger"
  type        = string
}

variable "service_account" {
  description = "The IAM service account email associated with the trigger."
  type        = string
}

variable "path" {
  description = "The relative path on the Cloud Run service the events should be sent to."
  type        = string
  default     = ""
}

variable "service" {
  description = " The name of the Cloud Run/GKE service being addressed."
  type        = string
  default     = ""
}

variable "cluster" {
  description = "The name of the cluster the GKE service is running in."
  type        = string
  default     = ""
}

variable "location" {
  description = "The name of the Google Compute Engine in which the cluster resides"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The namespace the GKE service is running in."
  type        = string
  default     = ""
}

variable "workflow" {
  description = "value"
  type        = string
  default     = ""
}

variable "subscription" {
  description = "The name of the Pub/Sub subscription created and managed by Eventarc system"
  type        = string
  default     = ""
}

variable "topic" {
  description = "The name of the Pub/Sub topic created and managed by Eventarc system"
  type        = string
  default     = ""
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

variable "matching_criteria" {
  description = "Required labels for AutoZone"
  type = map(object({
    attribute = string
    value1    = string
    operator  = string
  }))
}