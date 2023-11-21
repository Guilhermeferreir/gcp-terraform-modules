resource "null_resource" "previous" {}
resource "time_sleep" "wait_60_seconds" {
  depends_on      = [null_resource.previous]
  create_duration = "60s"
}

resource "google_project_service" "firestore" {
  project    = var.project_id
  service    = "firestore.googleapis.com"
  depends_on = [time_sleep.wait_60_seconds]
}

resource "google_firestore_database" "database" {
  project                     = var.project_id
  name                        = var.name
  location_id                 = var.location_id
  type                        = var.type
  concurrency_mode            = var.concurrency_mode
  app_engine_integration_mode = var.app_engine_integration_mode
  depends_on                  = [google_project_service.firestore]
}

