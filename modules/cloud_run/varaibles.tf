variable "project_id" {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = ""
}

variable "cloud_run_service_name" {
  description = "Name of the cloud run service"
  type        = string
}

variable "region" {
  description = "The Region of the Workflow"
  type        = string
}

variable "gcp_labels" {
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

variable "cloud_run_service_config" {
  description = "If specified, terraform will create a cloud run service. Otherwise, use cloud_run_service_name."
  type = object({
    # containet_image = "us-docker.pkg.dev/cloudrun/container/hello"
    container_image           = string
    vpc_access_connector_name = string
    max_instances             = number
  })
  default = {
    container_image           = "us-docker.pkg.dev/cloudrun/container/hello"
    vpc_access_connector_name = "tfservconn"
    max_instances             = 10
  }
}

