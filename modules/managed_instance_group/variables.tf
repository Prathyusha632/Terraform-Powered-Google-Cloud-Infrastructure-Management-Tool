variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "instance_template_name" {
  description = "Name for the instance template"
  type        = string
}

variable "machine_type" {
  description = "Machine type for instances"
  type        = string
}

variable "disk_image" {
  description = "Disk image to use"
  type        = string
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name"
  type        = string
}

variable "min_replicas" {
  description = "Minimum number of instances"
  type        = number
  default     = 1
}

variable "max_replicas" {
  description = "Maximum number of instances"
  type        = number
  default     = 5
}

variable "target_cpu_utilization" {
  description = "CPU utilization target for scaling"
  type        = number
  default     = 0.6
}
