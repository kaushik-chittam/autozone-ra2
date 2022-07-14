module "eventarc_trigger_config" {
  source          = "../modules/eventarc_trigger"
  project_id      = var.project_id
  trigger_name    = "az-workflow-trigger"
  location        = var.region
  service_account = "${var.project_number}-compute@developer.gserviceaccount.com"
  matching_criteria = {
    criteria1 = {
      attribute = "type"
      value1    = "google.cloud.pubsub.topic.v1.messagePublished"
      operator  = "attributes.name=\"workflow\""
    }
  }
  workflow = "az-workflow-1"
  topic    = "projects/az-test-355718/topics/topic1-dev"

  depends_on = [module.enable_services, module.workflow_config, module.pub_sub_config1]
}