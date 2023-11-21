resource "google_service_account" "service_account" {
  account_id   = "gke-sa"
  display_name = "GKE Service Account"
  project      = var.project
}

resource "google_project_iam_member" "storage_object_viewer" {
  project = var.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [
    google_service_account.service_account
  ]
}

resource "google_project_iam_member" "error_reporting_writer" {
  project = var.project
  role    = "roles/errorreporting.writer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [
    google_service_account.service_account,
    google_project_iam_member.storage_object_viewer
  ]
}

resource "google_project_iam_member" "logs_writer" {
  project = var.project
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [
    google_service_account.service_account,
    google_project_iam_member.error_reporting_writer
  ]
}

resource "google_project_iam_member" "cloud_monitoring_metric_writer" {
  project = var.project
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [
    google_service_account.service_account,
    google_project_iam_member.logs_writer
  ]
}

resource "null_resource" "previous_sa" {}
resource "time_sleep" "wait_60_seconds_sa" {
  depends_on      = [null_resource.previous_sa]
  create_duration = "60s"
}

resource "google_container_cluster" "gke_cluster" {

  name           = var.name
  project        = var.project
  network        = var.network
  subnetwork     = var.subnetwork
  location       = var.location
  node_locations = var.node_locations

  provider                 = google-beta
  monitoring_service       = var.cluster_monitoring_service
  logging_service          = var.cluster_logging_service
  remove_default_node_pool = true
  initial_node_count       = var.cluster_initial_node_count
  enable_shielded_nodes    = true
  networking_mode          = var.cluster_networking_mode

  pod_security_policy_config {
    enabled = false
  }

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  addons_config {
    network_policy_config {
      disabled = false
    }
  }

  default_snat_status {
    disabled = false
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.authorized_ipv4_cidr_block != null ? var.authorized_ipv4_cidr_block : []
      content {
        cidr_block   = cidr_blocks.value.cidr
        display_name = cidr_blocks.value.comment
      }
    }
  }

  node_config {
    disk_size_gb    = var.cluster_disk_size_gb
    disk_type       = var.cluster_disk_type
    image_type      = var.cluster_image_type
    machine_type    = var.cluster_machine_type
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    service_account = google_service_account.service_account.email
    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = true
    }
    metadata = {
      disable-legacy-endpoints = true
    }
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = var.enable_private_nodes
    master_global_access_config {
      enabled = false
    }
    master_ipv4_cidr_block = var.cluster_master_ipv4_cidr_block
  }

  release_channel {
    channel = var.release_channel
  }

  resource_labels = var.labels

  workload_identity_config {
    workload_pool = format("%s.svc.id.goog", var.project)
  }

  cluster_autoscaling {
    enabled             = false
    autoscaling_profile = var.autoscaling_profile
  }

  depends_on = [
    time_sleep.wait_60_seconds_sa,
    google_service_account.service_account,
  ]

}

resource "google_container_node_pool" "gke_cluster_node" {

  for_each = var.node_pools

  provider          = google-beta
  name              = each.key
  node_count        = each.value.node_count
  node_locations    = var.node_locations
  project           = var.project
  cluster           = google_container_cluster.gke_cluster.name
  location          = var.location
  max_pods_per_node = var.max_pods_per_node

  dynamic "autoscaling" {
    for_each = each.value.autoscaling_enable ? [1] : []
    content {
      min_node_count = each.value.autoscaling_pool_min_node_count
      max_node_count = each.value.autoscaling_pool_max_node_count
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {

    preemptible = each.value.preemptible

    disk_size_gb = each.value.disk_size_gb
    disk_type    = each.value.disk_type
    image_type   = var.cluster_image_type
    machine_type = each.value.machine_type

    metadata = {
      disable-legacy-endpoints = true
    }

    labels = each.value.labels

    dynamic "taint" {
      for_each = each.value.taint
      content {
        key    = taint.value.key
        value  = taint.value.value
        effect = taint.value.effect
      }
    }

    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    service_account = google_service_account.service_account.email

    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = true
    }

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

  }

  upgrade_settings {
    max_surge       = var.max_surge
    max_unavailable = var.max_unavailable
  }

  depends_on = [
    google_container_cluster.gke_cluster
  ]

  lifecycle {
    ignore_changes = [
      node_count
    ]
  }

}