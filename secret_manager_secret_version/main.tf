resource "google_secret_manager_secret_version" "version" {
  secret      = var.secret
  secret_data = var.secret_data
}