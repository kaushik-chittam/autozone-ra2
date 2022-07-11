module "vpc_access_connector_config" {
  source     = "../modules/vpc_access_connector"
  project_id = var.project_id
  //set the below configs as needed
  name   = "tfservconn"
  region = "us-central1"
  serverless_vpc_connector_config = {
    machine_type   = "e2-micro"
    max_throughput = 1000
    min_throughput = 200
  }
  #network_project_id = "az-test-355718"
  network_project_id = "snt-demo1"
  subnetwork_name    = "az-test-subnet"

  depends_on = [module.enable_services]
}