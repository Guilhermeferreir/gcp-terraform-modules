data "google_compute_network" "network" {
  name = var.network
}

resource "google_dns_managed_zone" "private_zone" {
  name        = var.name
  dns_name    = var.dns_name
  description = var.description
  labels      = var.labels
  visibility  = var.visibility
  private_visibility_config {
    networks {
      network_url = data.google_compute_network.network.id
    }
  }
}

resource "google_dns_record_set" "records" {
  for_each     = var.records
  name         = "${each.key}.${google_dns_managed_zone.private_zone.dns_name}"
  managed_zone = google_dns_managed_zone.private_zone.name
  type         = each.value.type
  ttl          = each.value.ttl
  rrdatas      = each.value.rrdatas
}