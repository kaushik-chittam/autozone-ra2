provider "google" {
  project = var.project_id
  region  = "us-central1"
  #impersonate_service_account = "terraform@${var.project_id}.iam.gserviceaccount.com"
}

provider "google-beta" {
  project = var.project_id
  region  = "us-central1"
  #impersonate_service_account = "terraform@${var.project_id}.iam.gserviceaccount.com"
}

provider "random" {}

terraform {
  backend "gcs" {
    #bucket = "statefile-bucket-az-test-355718" #change name
    bucket = "statefile-bucket-snt-demo1"
    prefix = "statefile"
  }
}