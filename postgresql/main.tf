
resource "google_sql_database_instance" "postgresql" {
  provider            = google-beta
  project             = var.project
  name                = var.name
  database_version    = var.database_version
  region              = var.region
  deletion_protection = var.deletion_protection

  settings {
    tier              = "${var.tier}-${var.cpu}-${var.memory}"
    availability_type = var.availability_type
    user_labels       = var.user_labels
    database_flags {
      name  = "log_connections"
      value = "on"
    }
    database_flags {
      name  = "log_checkpoints"
      value = "on"
    }
    database_flags {
      name  = "log_temp_files"
      value = "0"
    }
    database_flags {
      name  = "log_lock_waits"
      value = "on"
    }
    database_flags {
      name  = "log_disconnections"
      value = "on"
    }
    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = "https://www.googleapis.com/compute/v1/projects/${var.project}/global/networks/${var.private_network}"
      require_ssl     = var.require_ssl
    }
    backup_configuration {
      binary_log_enabled             = var.binary_log_enabled
      enabled                        = var.backup_enabled
      start_time                     = var.backup_start_time
      location                       = var.backup_location
      point_in_time_recovery_enabled = var.point_in_time_recovery_enabled
      backup_retention_settings {
        retained_backups = var.retained_backups
        retention_unit   = var.retention_unit
      }
    }
  }

  lifecycle {
    ignore_changes = [
      settings.0.user_labels,
    ]
  }

}

resource "random_password" "user-password" {
  keepers = {
    name = google_sql_database_instance.postgresql.name
  }
  length     = 14
  special    = true
  depends_on = [google_sql_database_instance.postgresql]
}

resource "google_secret_manager_secret" "postgressql-password" {
  secret_id = "postgresql-${var.name}-password"
  project   = var.project
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version-basic" {
  secret      = google_secret_manager_secret.postgressql-password.id
  secret_data = random_password.user-password.result
}
