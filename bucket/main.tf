resource "google_storage_bucket" "bucket" {
  name                        = var.bucket_name
  force_destroy               = var.force_destroy
  location                    = var.location
  storage_class               = var.storage_class
  labels                      = var.labels
  project                     = var.project_id
  uniform_bucket_level_access = var.uniform_bucket_level_access
  public_access_prevention    = var.public_access_prevention
  versioning {
    enabled = var.versioning_enabled
  }
}