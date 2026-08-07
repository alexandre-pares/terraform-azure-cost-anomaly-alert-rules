output "cost_anomaly_alert_rule" {
  description = <<DESCRIPTION

  Informations about the cost anomaly alert rule created in the module.

  The map value contains the following attributes:
  - `name` - Name
  - `display_name` - Display Name
  - `resource_id` - The full id
  - `resource` - The full azapi_resource

  DESCRIPTION

  value = module.daily_cost_anomaly_alert_rule.cost_anomaly_alert_rule
}
