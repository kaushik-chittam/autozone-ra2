module "enable_services" {
  source     = "../modules/enable_services"
  project_id = var.project_id
  gcp_service_list = [
    #"artifactregistry.googleapis.com",  #Artifact Registry API
    #"dns.googleapis.com",               #Cloud DNS API
    #"servicenetworking.googleapis.com", #Service Networking API
    #"sqladmin.googleapis.com",          #Cloud SQL Admin API
    #"secretmanager.googleapis.com",     #Secret Manager API
    #"file.googleapis.com",              #File Store API
    #"compute.googleapis.com",           #Compute Engine API
    "run.googleapis.com",       #Cloud Run API
    "vpcaccess.googleapis.com", #Serverless VPC Access API
    #"container.googleapis.com",         #Kubernetes Engine API
    "cloudfunctions.googleapis.com", #Cloud Functions API
    "workflows.googleapis.com",      #Workflows API
    "dataflow.googleapis.com",       #Dataflow API
    #"orgpolicy.googleapis.com",          #Organization Policy API
    "cloudkms.googleapis.com",  #Cloud Key Management Service (KMS) API
    "eventarc.googleapis.com",  #Eventarc API
    "cloudbuild.googleapis.com" #Cloud Build API
  ]
}
