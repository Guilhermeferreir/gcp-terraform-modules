output "pubsub_topic_id" {
  description = "Pub/Sub Topic ID"
  value       = google_pubsub_topic.topic.id
}