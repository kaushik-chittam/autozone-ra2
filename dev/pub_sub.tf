module "pub_sub_config1" {
  source      = "../modules/pub_sub"
  project_id  = var.project_id
  environment = var.environment
  //set the below configs as needed
  topic_name                 = "topic1"
  subscription_name          = "subscription1"
  message_retention_duration = "1200s"
  retain_acked_messages      = true
  ack_deadline_seconds       = 20
  service_account_email = "serviceAccount:service-${project_number}@gcp-sa-pubsub.iam.gserviceaccount.com"
  push_endpoint = "https://pubsub.googleapis.com/v1/topic2-dev:publish"

  depends_on = [module.enable_services]
}

module "pub_sub_config2" {
  source      = "../modules/pub_sub"
  project_id  = var.project_id
  environment = var.environment
  //set the below configs as needed
  topic_name                 = "topic2"
  subscription_name          = "subscription2"
  message_retention_duration = "1200s"
  retain_acked_messages      = true
  ack_deadline_seconds       = 20

  depends_on = [module.enable_services]
}

module "pub_sub_config3" {
  source      = "../modules/pub_sub"
  project_id  = var.project_id
  environment = var.environment
  //set the below configs as needed
  topic_name                 = "topic3"
  subscription_name          = "subscription3"
  message_retention_duration = "1200s"
  retain_acked_messages      = true
  ack_deadline_seconds       = 20

  depends_on = [module.enable_services]
}

module "pub_sub_config4" {
  source      = "../modules/pub_sub"
  project_id  = var.project_id
  environment = var.environment
  //set the below configs as needed
  topic_name                 = "topic4"
  subscription_name          = "subscription4"
  message_retention_duration = "1200s"
  retain_acked_messages      = true
  ack_deadline_seconds       = 20

  depends_on = [module.enable_services]
}
