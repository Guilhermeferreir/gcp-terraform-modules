resource "google_compute_router" "cloud_nat_router" {
  name    = var.cloud_router_name
  region  = var.region
  network = var.network
}

resource "google_compute_router_nat" "cloud_nat_gateway" {
  name                               = var.cloud_nat_name
  router                             = var.cloud_router_name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnetwork {
    name                    = var.subnetwork
    source_ip_ranges_to_nat = var.source_ip_ranges_to_nat
  }
  depends_on = [
    google_compute_router.cloud_nat_router
  ]
}