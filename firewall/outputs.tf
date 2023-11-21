output "firewall_id" {
  description = "Firewall ID"
  value       = google_compute_firewall.firewall.id
}