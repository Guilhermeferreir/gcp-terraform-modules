output "cloud_task_id" {
  description = "Cloud Task ID"
  value       = google_cloud_tasks_queue.default.id
}