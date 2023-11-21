resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = var.protocol_icmp
  }

  allow {
    protocol = var.protocol_tcp
    ports    = var.ports
  }

  source_tags = var.source_tags
}