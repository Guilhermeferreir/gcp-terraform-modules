output "secret_version_id" {
  description = "Secret Version ID"
  value       = google_secret_manager_secret_version.version.id
}