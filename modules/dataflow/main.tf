locals {
  #labels = merge(var.labels, var.gcp_az_labels)
  #name = "${var.dataflow_job_name}-${random_string.suffix.result}"
  name = "${var.dataflow_job_name}-1234" #test
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "google_dataflow_job" "dataflow_job" {
  project           = var.project_id
  zone              = var.zone
  region            = var.region
  name              = local.name
  network           = var.network
  subnetwork        = var.subnetwork
  template_gcs_path = var.template_gcs_path
  temp_gcs_location = var.temp_gcs_location
  #labels            = local.labels
  #parameters        = var.parameters
  parameters = {
    inputFile = var.inputFilePattern
    output    = var.outputFilePattern
  }
  transform_name_mapping       = var.transform_name_mapping
  max_workers                  = var.max_workers
  on_delete                    = var.on_delete
  skip_wait_on_job_termination = var.skip_wait_on_job_termination
  service_account_email        = var.service_account_email
  machine_type                 = var.machine_type
  #kms_key_name = google_kms_crypto_key.main.id
  #ip_configuration = var.ip_configuration
  additional_experiments  = var.additional_experiments
  enable_streaming_engine = var.enable_streaming_engine
}

