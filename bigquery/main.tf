resource "null_resource" "previous" {}
resource "time_sleep" "wait_60_seconds" {
  depends_on      = [null_resource.previous]
  create_duration = "60s"
}

resource "google_project_service" "bigquery" {
  project    = var.project_id
  service    = "bigquery.googleapis.com"
  depends_on = [time_sleep.wait_60_seconds]
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id    = var.dataset_id
  friendly_name = var.friendly_name
  description   = var.description
  location      = var.location
  labels        = var.labels
}

