module "cloudrun_config" {
  source                 = "../modules/cloud_run"
  project_id             = var.project_id
  region                 = var.region
  cloud_run_service_name = "test-service1"
  cloud_run_service_config = {
    container_image           = "us-docker.pkg.dev/cloudrun/container/hello"
    vpc_access_connector_name = "tfservconn"
    max_instances             = 10
  }
  depends_on = [module.enable_services, module.vpc_access_connector_config]
}