resource "null_resource" "previous" {}
resource "time_sleep" "wait_60_seconds" {
  depends_on      = [null_resource.previous]
  create_duration = "60s"
}

resource "google_project_service" "compute" {
  project    = var.project_id
  service    = "compute.googleapis.com"
  depends_on = [time_sleep.wait_60_seconds]
}

resource "google_compute_instance" "instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone_instance

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {}
  }

  depends_on = [google_project_service.compute]

  labels = var.labels

}
