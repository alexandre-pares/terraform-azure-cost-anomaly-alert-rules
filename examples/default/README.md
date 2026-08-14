# Daily Cost Anomaly Alert rule

This example create a cost anomaly alert rule for the default subscription.

## Usage


```hcl
module "daily_cost_anomaly_alert_rule" {
  source  = "alexandre-pares/cost-anomaly-alert-rules/azure"
  version = "1.0.1"

  name           = "dailyanomalybyresourcegroupforsubsandbox"
  display_name   = "Daily cost anomaly for subscription sandbox"
  contact_emails = ["john.doe@example.com"]
  subject        = "Daily cost anomaly alert for subscription sandbox"
  start_date     = "2026-08-07"
  language       = "en"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 2.10 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_daily_cost_anomaly_alert_rule"></a> [daily\_cost\_anomaly\_alert\_rule](#module\_daily\_cost\_anomaly\_alert\_rule) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_cost_anomaly_alert_rule"></a> [cost\_anomaly\_alert\_rule](#output\_cost\_anomaly\_alert\_rule) | Informations about the cost anomaly alert rule created in the module.<br/><br/>  The map value contains the following attributes:<br/>  - `name` - Name<br/>  - `display_name` - Display Name<br/>  - `resource_id` - The full id<br/>  - `resource` - The full azapi\_resource |
<!-- END_TF_DOCS -->
