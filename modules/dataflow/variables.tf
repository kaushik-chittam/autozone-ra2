variable "project_id" {
  description = "Name of the Project"
  type        = string
}

variable "region" {
  description = "The region of the Workflow"
  type        = string
}

variable "zone" {
  description = "The zone of the Workflow"
  type        = string
}

variable "dataflow_job_name" {
  description = "A unique name for the resource, required by Dataflow."
  type        = string
}

variable "template_gcs_path" {
  description = "The Google Cloud Storage path to the Dataflow job template."
  type        = string
}

variable "temp_gcs_location" {
  description = "A writeable location on Google Cloud Storage for the Dataflow job to dump its temporary data."
  type        = string
}

variable "inputFilePattern" {
  description = "Key/Value pairs to be passed to the Dataflow job (as used in the template)."
  type        = string
  default     = ""
}

variable "outputFilePattern" {
  description = "Key/Value pairs to be passed to the Dataflow job (as used in the template)."
  type        = string
  default     = ""
}

variable "transform_name_mapping" {
  description = "Only applicable when updating a pipeline. Map of transform name prefixes of the job to be replaced with the corresponding name prefixes of the new job."
  type        = map(string)
  default     = {}
}

variable "max_workers" {
  description = "The number of workers permitted to work on the job. More workers may improve processing speed at additional cost."
  type        = number
  default     = 1
}

variable "on_delete" {
  description = "One of 'drain' or 'cancel'. Specifies behavior of deletion during terraform destroy."
  type        = string
  default     = ""
}

variable "skip_wait_on_job_termination" {
  description = "If true, treat DRAINING and CANCELLING as terminal job states and do not wait for further changes before removing from terraform state and moving on."
  type        = bool
  default     = false
}

variable "service_account_email" {
  description = "The Service Account email used to create the job."
  type        = string
  default     = ""
}

variable "network" {
  description = "The network to which VMs will be assigned. If it is not provided, 'default' will be used."
  type        = string
  default     = ""
}

variable "subnetwork" {
  description = "The subnetwork to which VMs will be assigned. Should be of the form 'regions/REGION/subnetworks/SUBNETWORK'."
  type        = string
  default     = ""
}


variable "machine_type" {
  description = "The machine type to use for the job."
  type        = string
  default     = ""
}


variable "ip_configuration" {
  description = "The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'."
  type        = string
  default     = ""
}


variable "additional_experiments" {
  description = "List of experiments that should be used by the job. An example value is ['enable_stackdriver_agent_metrics']."
  type        = set(string)
  default     = []
}


variable "enable_streaming_engine" {
  description = "Indicates if the job should use the streaming engine feature."
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

variable "name_prefix" {
  description = "Prefix of the cloudsql instance name."
  type        = string
  default     = "gcp-"
}

variable "key_rotation_period" {
  type    = string
  default = "7776000s"
}
