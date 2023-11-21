resource "google_cloud_tasks_queue" "default" {
  name     = var.name
  location = var.location
}
