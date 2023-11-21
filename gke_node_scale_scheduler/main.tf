locals {
  version  = "0.1.0"
  root_dir = abspath("${path.module}/src")
}

# Compress source code
data "archive_file" "source" {
  type        = "zip"
  source_dir  = local.root_dir
  output_path = "/tmp/function-${local.version}.zip"
}

# Create bucket that will host the source code
resource "google_storage_bucket" "bucket" {
  name                        = var.scheduler_code_bucket_name
  project                     = var.project_id
  location                    = var.region
  uniform_bucket_level_access = true
}

# Add source code zip to bucket
resource "google_storage_bucket_object" "zip" {
  # Append file MD5 to force bucket to be recreated
  name   = "source-${local.version}.zip"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.source.output_path
}

# Enable Cloud Scheduler API
resource "google_project_service" "cs" {
  project                    = var.project_id
  service                    = "cloudscheduler.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}

# Enable Cloud Functions API
resource "google_project_service" "cf" {
  project                    = var.project_id
  service                    = "cloudfunctions.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}

# Enable Cloud Build API
resource "google_project_service" "cb" {
  project                    = var.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}

# Create Service Account to invoke the function
resource "google_service_account" "service_account" {
  account_id   = "sa-gke-node-scale-scheduler"
  display_name = "GKE Node Scale Scheduler Service Account"
  project      = var.project_id
}

# Create Pub/Sub topic to invke the function
resource "google_pubsub_topic" "topic" {
  provider = google-beta
  name     = "gke-node-scale-function-topic"
  project  = var.project_id
}

# Create Cloud Function
resource "google_cloudfunctions_function" "gke_node_scale_scheduler" {
  name                  = "gke-node-scale-function"
  project               = var.project_id
  region                = var.region
  runtime               = "nodejs16"
  entry_point           = "scaleGke"
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.zip.name
  available_memory_mb   = 128
  ingress_settings      = "ALLOW_INTERNAL_ONLY"
  service_account_email = google_service_account.service_account.email

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.topic.id
  }

  depends_on = [
    google_pubsub_topic.topic,
    google_storage_bucket_object.zip,
    google_project_service.cs,
    google_project_service.cf,
    google_project_service.cb
  ]

}

resource "google_project_iam_member" "cluster_role" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [
    google_service_account.service_account
  ]
}

resource "google_project_iam_member" "cloudfunction_invoker" {
  project = var.project_id
  role    = "roles/cloudfunctions.invoker"
  member  = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [
    google_service_account.service_account
  ]
}

resource "google_cloud_scheduler_job" "job_stop" {

  for_each    = var.cluster_nodes_list
  name        = "${each.key}-gke-node-scale-stop-scheduler"
  description = "Stop GKE Node - Project: ${each.value.project_id} - Cluster: ${each.value.cluster_id}"
  schedule    = each.value.scheduler_stop_cron_expr
  time_zone   = each.value.scheduler_time_zone
  project     = var.project_id

  retry_config {
    retry_count = 1
  }

  pubsub_target {
    topic_name = google_pubsub_topic.topic.id
    data       = base64encode("{\"project_id\":\"${each.value.project_id}\",\"location\":\"${each.value.location}\",\"cluster_id\":\"${each.value.cluster_id}\",\"node_pool_id\":\"${each.value.node_pool_id}\",\"node_count\":0}")
  }

  depends_on = [
    google_cloudfunctions_function.gke_node_scale_scheduler
  ]
}

resource "google_cloud_scheduler_job" "job_start" {

  for_each    = var.cluster_nodes_list
  name        = "${each.key}-gke-node-scale-start-scheduler"
  description = "Start GKE Node - Project: ${each.value.project_id} - Cluster: ${each.value.cluster_id}"
  schedule    = each.value.scheduler_start_cron_expr
  time_zone   = each.value.scheduler_time_zone
  project     = var.project_id

  retry_config {
    retry_count = 1
  }

  pubsub_target {
    topic_name = google_pubsub_topic.topic.id
    data       = base64encode("{\"project_id\":\"${each.value.project_id}\",\"location\":\"${each.value.location}\",\"cluster_id\":\"${each.value.cluster_id}\",\"node_pool_id\":\"${each.value.node_pool_id}\",\"node_count\":${each.value.node_count}}")
  }

  depends_on = [
    google_cloud_scheduler_job.job_stop,
    google_cloudfunctions_function.gke_node_scale_scheduler
  ]

}
