output "vpc_network_id" {
  description = "The ID of the created VPC network."
  value       = google_compute_network.vpc_network.id
}