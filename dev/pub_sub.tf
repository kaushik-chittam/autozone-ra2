module "pub_sub_config1" {
  source      = "../modules/pub_sub"
  project_id  = var.project_id
  environment = var.environment
  //set the below configs as needed
  topic_name                 = "topic1"
  message_retention_duration = "1200s"
  subscription_details = {
    subscription1 = {
      service_account_email        = ""
      audience                     = ""
      push_endpoint                = ""
      filter                       = "attributes.name=\"pubsub\""
      dead_letter_topic            = ""
      max_delivery_attempts        = 5
      minimum_backoff              = ""
      maximum_backoff              = ""
      ttl                          = ""
      enable_exactly_once_delivery = false
      enable_message_ordering      = false
      retain_acked_messages        = true
      ack_deadline_seconds         = 20
    },
    subscription2 = {
      service_account_email        = "${var.project_number}-compute@developer.gserviceaccount.com"
      audience                     = ""
      push_endpoint                = "https://workflowexecutions.googleapis.com/v1/projects/az-test-355718/locations/us-central1/workflows/workflow-1/executions"
      filter                       = "attributes.name=\"workflow\""
      dead_letter_topic            = ""
      max_delivery_attempts        = 5
      minimum_backoff              = ""
      maximum_backoff              = ""
      ttl                          = ""
      enable_exactly_once_delivery = false
      enable_message_ordering      = false
      retain_acked_messages        = true
      ack_deadline_seconds         = 20
    }
  }

  depends_on = [module.enable_services, module.iam_config, module.pub_sub_config2]
}

module "pub_sub_config2" {
  source      = "../modules/pub_sub"
  project_id  = var.project_id
  environment = var.environment
  //set the below configs as needed
  topic_name                 = "topic2"
  message_retention_duration = "1200s"
  subscription_details = {
    subscription3 = {
      service_account_email        = "${var.project_number}-compute@developer.gserviceaccount.com"
      audience                     = ""
      push_endpoint                = "https://az-test-app-1-vrf23xlkza-uc.a.run.app"
      filter                       = ""
      dead_letter_topic            = ""
      max_delivery_attempts        = 5
      minimum_backoff              = ""
      maximum_backoff              = ""
      ttl                          = ""
      enable_exactly_once_delivery = false
      enable_message_ordering      = false
      retain_acked_messages        = true
      ack_deadline_seconds         = 20
    }
  }

  depends_on = [module.enable_services, module.iam_config]
}
