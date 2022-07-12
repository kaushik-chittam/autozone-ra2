module "eventarc_trigger_config" {
  source          = "../modules/eventarc_trigger"
  project_id      = var.project_id
  trigger_name    = "workflow-trigger"
  location        = var.region
  service_account = "${var.project_number}-compute@developer.gserviceaccount.com"
  value           = "google.cloud.pubsub.topic.v1.messagePublished"
  operator        = ""
  workflow        = "workflow-1"

  depends_on = [module.enable_services]
}