data "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.cluster_location
  project  = var.project_id
}

data "google_client_config" "client" {}

provider "helm" {
  kubernetes {
    token                  = data.google_client_config.client.access_token
    host                   = data.google_container_cluster.gke_cluster.endpoint
    cluster_ca_certificate = base64decode(data.google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate)
  }
}

resource "helm_release" "kong_ingress" {
  repository            = "https://charts.konghq.com"
  name                  = "kong"
  namespace             = "kong-ingress"
  create_namespace      = true
  chart                 = "kong"
  render_subchart_notes = true
  timeout               = 300
  wait                  = true
  atomic                = true
}

