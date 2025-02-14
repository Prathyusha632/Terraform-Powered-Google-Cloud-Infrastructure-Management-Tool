output "instance_group_manager_id" {
  description = "ID of the Instance Group Manager"
  value       = google_compute_region_instance_group_manager.default.id
}

output "autoscaler_id" {
  description = "ID of the Autoscaler"
  value       = google_compute_region_autoscaler.default.id
}
