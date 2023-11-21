output "name" {
  value       = google_container_cluster.gke_cluster.name
  description = "The Kubernetes cluster name."
}