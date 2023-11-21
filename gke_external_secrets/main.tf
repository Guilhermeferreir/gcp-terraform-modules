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
  experiments {
    manifest = true
  }
}

data "google_secret_manager_secret_version" "secret_manager_sa_content" {
  project  = var.project_id
  provider = google-beta
  secret   = var.secret_sa_content
  version  = "latest"
}

resource "helm_release" "external_secrets" {
  repository            = "https://charts.external-secrets.io"
  name                  = "external-secrets"
  namespace             = var.namespace
  create_namespace      = true
  chart                 = "external-secrets"
  version               = "v0.8.3"
  render_subchart_notes = true
  timeout               = 300
  wait                  = true
  atomic                = true
}

provider "kubectl" {
  host                   = data.google_container_cluster.gke_cluster.endpoint
  cluster_ca_certificate = base64decode(data.google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate)
  token                  = data.google_client_config.client.access_token
  load_config_file       = false
}

resource "kubectl_manifest" "secret_sa" {
  depends_on = [
    helm_release.external_secrets,
    data.google_secret_manager_secret_version.secret_manager_sa_content
  ]
  yaml_body = <<YAML
apiVersion: v1
data:
  ${var.secret_key}: ${data.google_secret_manager_secret_version.secret_manager_sa_content.secret_data}
kind: Secret
metadata:
  labels:
    type: gcpsm
  name: ${var.secret_name}
  namespace: ${var.namespace}
type: Opaque
YAML
}

resource "kubectl_manifest" "secret_store" {
  depends_on = [
    kubectl_manifest.secret_sa
  ]
  yaml_body = <<YAML
apiVersion: external-secrets.io/v1alpha1
kind: ClusterSecretStore
metadata:
  name: ${var.secret_store_name}
spec:
  provider:
    gcpsm:
      projectID: ${var.project_id}
      auth:
        secretRef:
          secretAccessKeySecretRef:
            namespace: ${var.namespace}
            name: ${var.secret_name}
            key: ${var.secret_key}
YAML
}
