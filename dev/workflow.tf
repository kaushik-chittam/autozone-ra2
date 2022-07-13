module "workflow_config" {
  source      = "../modules/workflow"
  project_id  = var.project_id
  environment = var.environment
  region      = var.region
  //set the below configs as needed
  account_id      = "workflow"
  display_name    = "workflow account"
  workflow_name   = "az-workflow-1"
  service_account = "${var.project_number}-compute@developer.gserviceaccount.com"
  description     = "Sample Workflow"
  source_contents = <<-EOF
main:
  params: [event]
  steps:
    - decode_pubsub_message:
        assign:
           - base64: $${base64.decode(event.data.message.data)}
           - message: $${text.decode(base64)}
        next: conditionalSwitch
    - conditionalSwitch:
        switch:
          - condition: $${message=="workflow"}
            next: cloud_run1
          - condition: $${message=="workflow1"}
            next: cloud_function1
        next: default
    - cloud_run1:
        call: http.post
        args:
          url: https://az-test-app-2-vrf23xlkza-uc.a.run.app
          auth:
            type: OIDC
        result: floor_result
    - return_result:
        return: $${floor_result}
    - cloud_function1:
        return: "Hello from Cloud Function"
    - default: 
        return: "Hello from Workflow"
EOF
  depends_on      = [module.enable_services]
}