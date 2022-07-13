module "dataflow_config" {
  source            = "../modules/dataflow"
  project_id        = var.project_id
  region            = var.region
  zone              = var.zone
  network           = "az-test-network"
  subnetwork        = "https://www.googleapis.com/compute/v1/projects/az-test-355718/regions/us-central1/subnetworks/az-test-subnet"
  dataflow_job_name = "az-dataflow-test"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://${module.dataflow-bucket.name}/temp1"
  //set the below configs as needed
  name_prefix         = "gcp-"
  key_rotation_period = "7776000s"
  parameters = {
    inputFile = "gs://dataflow-samples/shakespeare/kinglear.txt"
    output    = "gs://${module.dataflow-bucket.name}/output/my_output"
  }

  depends_on = [module.enable_services, module.dataflow-bucket]
}

module "dataflow-bucket" {
  source = "../modules/cloud_storage"
  name   = "dataflow_sample_test_bucket1"
  #name       = "dataflow_sample_test_bucket"
  region        = var.region
  project_id    = var.project_id
  force_destroy = true

  depends_on = [module.enable_services]
}

module "dataflow_config1" {
  source            = "../modules/dataflow"
  project_id        = var.project_id
  region            = var.region
  zone              = var.zone
  network           = "az-test-network"
  subnetwork        = "https://www.googleapis.com/compute/v1/projects/az-test-355718/regions/us-central1/subnetworks/az-test-subnet"
  dataflow_job_name = "az-dataflow-test-1"
  template_gcs_path = "gs://dataflow-templates-us-central1/latest/Cloud_PubSub_to_Cloud_PubSub"
  temp_gcs_location = "gs://${module.dataflow-bucket1.name}/temp"
  //set the below configs as needed
  name_prefix         = "gcp-"
  key_rotation_period = "7776000s"
  parameters = {
    inputSubscription = "projects/az-test-355718/subscriptions/subscription1-dev"
    outputTopic       = "projects/az-test-355718/topics/topic2-dev"
  }

  depends_on = [module.enable_services, module.dataflow-bucket]
}

module "dataflow-bucket1" {
  source = "../modules/cloud_storage"
  name   = "az-pubsub-dataflow-test"
  #name       = "dataflow_sample_test_bucket"
  region        = var.region
  project_id    = var.project_id
  force_destroy = true

  depends_on = [module.enable_services]
}