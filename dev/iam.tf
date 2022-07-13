module "iam_config" {
  source     = "../modules/iam"
  project_id = var.project_id
  role       = "roles/iam.serviceAccountTokenCreator"
  //set the below configs as needed
  member = "serviceAccount:service-${var.project_number}@gcp-sa-pubsub.iam.gserviceaccount.com"

  depends_on = [module.enable_services]
}

module "iam_config1" {
  source     = "../modules/iam"
  project_id = var.project_id
  role       = "roles/run.invoker"
  //set the below configs as needed
  member = "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com"

  depends_on = [module.enable_services]
}

module "iam_config2" {
  source     = "../modules/iam"
  project_id = var.project_id
  role       = "roles/run.invoker"
  //set the below configs as needed
  member = "serviceAccount:service-${var.project_number}@gcp-sa-workflows.iam.gserviceaccount.com"

  depends_on = [module.enable_services]
}
