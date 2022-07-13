provider "google" {
  project = var.project_id
  region  = "us-central1"
}

provider "google-beta" {
  project = var.project_id
  region  = "us-central1"
}

provider "random" {}

terraform {
  backend "gcs" {
    bucket = "statefile-bucket-az-test-355718" #change name
    #bucket = "statefile-bucket-snt-demo1"
    prefix = "statefile"
  }
}