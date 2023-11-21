output "vpc_id" {
  description = "VPC ID"
  value       = google_compute_network.vpc.id
}