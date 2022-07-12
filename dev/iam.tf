module "iam_config" {
  source     = "../modules/iam"
  project_id = var.project_id
  role       = "roles/iam.serviceAccountTokenCreator"
  //set the below configs as needed
  member = "serviceAccount:service-${var.project_number}@gcp-sa-pubsub.iam.gserviceaccount.com"

  depends_on = [module.enable_services]
}