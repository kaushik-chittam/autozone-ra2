variable "project_id" {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = ""
}

variable "environment" {
  description = "Name of the Environment"
  type        = string
}

variable "workflow_name" {
  description = "Name of the Workflow"
  type        = string
}

variable "region" {
  description = "The Region of the Workflow"
  type        = string
}

variable "description" {
  description = "Description of the workflow provided by the user. Must be at most 1000 unicode characters long."
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Name Prefix."
  type        = string
  default     = ""
}

variable "account_id" {
  description = "The account id that is used to generate the service account email address and a stable unique id. It is unique within a project, must be 6-30 characters long"
  type        = string
  default     = ""
}

variable "display_name" {
  description = "The display name for the service account. Can be updated without creating a new resource."
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

variable "source_contents" {
  type        = string
  description = "Workflow code to be executed. The size limit is 32KB."
  default     = ""
}

variable "labels" {
  description = "A map of key/value pairs to assign to all resources in this root-module."
  type        = map(string)
  default     = {}
}