output "cloud_nat_id" {
  description = "Cloud NAT ID"
  value       = google_compute_router.cloud_nat_router.id
}

output "cloud_router_id" {
  description = "Cloud Router ID"
  value       = google_compute_router_nat.cloud_nat_gateway.id
}