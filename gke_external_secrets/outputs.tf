output "deployment" {
  value       = helm_release.external_secrets.metadata
  description = "The state of deployment"
}