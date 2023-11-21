output "deployment" {
  value       = helm_release.kong_ingress.metadata
  description = "The state of deployment"
}