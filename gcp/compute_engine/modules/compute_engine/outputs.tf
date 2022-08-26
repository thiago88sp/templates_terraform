output "available_zones_in_region" {
  description = "List of available zones in region"
  value       = data.google_compute_zones.available.names
}

output "internal_ip" {
  description = "List of all details for compute instances"
  value       = google_compute_instance.default.network_interface[0].network_ip
  #sensitive   = true
}

output "vmname" {
  description = "List of all details for compute instances"
  value       = google_compute_instance.default.name
  #sensitive   = true
}

output "project_id" {
  description = "List of all details for compute instances"
  value       = google_compute_instance.default.project
}