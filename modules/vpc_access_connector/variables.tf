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

variable "name" {
  description = "Serverless VPC connector name. This must be unique within the project."
  type        = string
  default     = "tfservconn"
}

variable "project_id" {
  description = "The project_id where this set of resources are created."
  type        = string
  default     = "az-test-355718"
}

variable "region" {
  description = "Region to deploy the connector."
  type        = string
  default     = "us-central1"
}

variable "serverless_vpc_connector_config" {
  description = "Configuration of the serverless VPC connectors deployed to region"
  type = object({
    machine_type   = string
    max_throughput = number
    min_throughput = number
  })

  default = {
    machine_type   = "e2-micro"
    max_throughput = 1000
    min_throughput = 200
  }
}

variable "network_project_id" {
  description = "The project_id where the host vpc lives."
  type        = string
  default     = "az-test-355718"
}

variable "subnetwork_name" {
  description = "The name of the pre-created subtnetwork (suffix recommended -noserv or -vpc-conn) for VPC connectors"
  type        = string
  default     = "az-test-subnet"
}