provider "google" {
  project = "terraform-project-1280"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-vpc"
}

# module "vpc" {
#   source       = "./modules/vpc"
#   network_name = "terraform-modular-vpc"
# }

module "managed_instance_group" {
  source = "./modules/managed_instance_group"

  project_id              = "terraform-project-1280"
  region                  = "us-central1"
  instance_template_name  = "project-1"
  machine_type            = "e2-medium"
  disk_image              = "projects/debian-cloud/global/images/family/debian-11"
  network                 = "default"
  subnetwork              = "default"

  min_replicas            = 1
  max_replicas            = 5
  target_cpu_utilization  = 0.5
}


terraform {
  backend "gcs" {
    bucket  = "bucket-1280"
    prefix  = "terraform/state"
  }
}


