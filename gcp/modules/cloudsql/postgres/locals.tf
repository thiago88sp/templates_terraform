locals {
    // HA method using REGIONAL availability_type requires point in time recovery to be enabled
  point_in_time_recovery_enabled = var.availability_type == "REGIONAL" ? true : lookup(var.backup_configuration, "point_in_time_recovery_enabled", false)
  backups_enabled                = var.availability_type == "REGIONAL" ? true : lookup(var.backup_configuration, "enabled", false)

  retained_backups = lookup(var.backup_configuration, "retained_backups", null)
  retention_unit   = lookup(var.backup_configuration, "retention_unit", null)
}