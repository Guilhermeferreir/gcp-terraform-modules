output "secret_id" {
  description = "Secret ID"
  value       = google_secret_manager_secret.secret.id
}