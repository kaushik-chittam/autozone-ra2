module "eventarc_trigger_config" {
  source          = "../modules/eventarc_trigger"
  project_id      = var.project_id
  trigger_name    = "az-workflow-trigger"
  location        = var.region
  service_account = "${var.project_number}-compute@developer.gserviceaccount.com"
  value           = "google.cloud.pubsub.topic.v1.messagePublished"
  operator        = ""
  workflow        = "az-workflow-1"
  topic           = "projects/az-test-355718/topics/topic1-dev"

  depends_on = [module.enable_services, module.workflow_config, module.pub_sub_config1]
}