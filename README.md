# Cost Anomaly Alert Rules module for Microsoft Azure

Terraform module to manage Azure cost anomaly alert rules.

Create cost anomaly alert rules to receive daily/weekly/monthly detailed alerts by email. Support only Azure subscription, other scopes such as billing account (EA/MCA/MPA) or resource groups aren't supported by this service.

Learn more: https://learn.microsoft.com/en-us/azure/cost-management-billing/understand/analyze-unexpected-charges

## Usage

Detailed examples are available under the [`./examples`](./examples/) directory.

I recommend to integrate this module in your [subscription vending automation](https://github.com/Azure/terraform-azure-avm-ptn-alz-sub-vending).

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

## Requirements

- [Cost Management Contributor](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/management-and-governance#cost-management-contributor) over the desired scope

or

- `Microsoft.CostManagement/scheduledActions/write` for custom role

Learn more:

- https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/cost-mgt-alerts-monitor-usage-spending#required-permissions-for-alerts
- https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/management-and-governance#cost-management-contributor
- https://learn.microsoft.com/en-us/azure/cost-management-billing/understand/analyze-unexpected-charges#create-an-anomaly-alert


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 2.10 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | ~> 2.10 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [azapi_resource.this](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_client_config.current](https://registry.terraform.io/providers/azure/azapi/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_contact_emails"></a> [contact\_emails](#input\_contact\_emails) | List of email addresses to be added as contacts for the cost anomaly alert rules.<br/><br/>  Could be user email addresses or distribution lists.<br/>  The email addresses must be valid and able to receive emails from `microsoft-noreply@microsoft.com`.<br/><br/>  Examples:<pre>hcl<br/>  [<br/>    "john.doe@example.com",<br/>    "jane.doe@example.com"<br/>  ]</pre> | `list(string)` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name of the cost anomaly alert rule.<br/><br/>  If not set, `var.name` will be used.<br/><br/>  Examples:<br/><br/>  - `Daily cost anomaly for subscription alz-connectivity`<br/>  - `Weekly cost anomaly for subscription shared-aks-dev`<br/>  - `Monthly cost anomaly for subscription alz-management` | `string` | `null` | no |
| <a name="input_end_date"></a> [end\_date](#input\_end\_date) | End date of the cost anomaly alert rule.<br/><br/>  The end date can be up to 5 year from a start date.<br/><br/>  If not set, the maximum end date possible will be set. (5 years from the start date).<br/><br/>  Examples:<br/><br/>  - `2026-08-07` | `string` | `null` | no |
| <a name="input_language"></a> [language](#input\_language) | Language for the cost anomaly alert rule.<br/><br/>  Default is `en`.<br/><br/>  If an invalid language is provided, the resource may be update on each apply.<br/><br/>  Examples:<br/><br/>  - `en`<br/>  - `fr`<br/>  - `es` | `string` | `"en"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the cost anomaly alert rule.<br/><br/>  Examples:<br/><br/>  - `dailyanomalybyresourcegroupforsubalzconnectivity`<br/>  - `weeklyanomalybyresourcegroupforsubsharedaksdev`<br/>  - `monthlyanomalybyresourcegroupforsubalzmanagement` | `string` | n/a | yes |
| <a name="input_notification_email"></a> [notification\_email](#input\_notification\_email) | Email address of the point of contact that should get the unsubscribe requests and notification emails.<br/><br/>  If not set, the first email in the `var.contact_emails` wil be used.<br/><br/>  Example:<br/><br/>  - `john.doe@example.com` | `string` | `null` | no |
| <a name="input_start_date"></a> [start\_date](#input\_start\_date) | Start date of the cost anomaly alert rule.<br/><br/>  Examples:<br/><br/>  - `2026-08-07` | `string` | n/a | yes |
| <a name="input_subject"></a> [subject](#input\_subject) | Email subject line for the cost anomaly alert rule. Length is limited to 70 characters.<br/><br/>  Examples:<br/><br/>  - `Cost anomaly detected for subscription alz-connectivity`<br/>  - `Cost anomaly detected for EA billing account 12345678`<br/>  - `Cost anomaly detected for MCA billing account John Doe` | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription ID to be used for the cost anomaly alert rule.<br/><br/>  If not set, the subscription ID of the current context will be used.<br/><br/>  Examples:<br/><br/>  - `00000000-0000-4000-0000-000000000000` | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_cost_anomaly_alert_rule"></a> [cost\_anomaly\_alert\_rule](#output\_cost\_anomaly\_alert\_rule) | Informations about the cost anomaly alert rule created in the module.<br/><br/>  The map value contains the following attributes:<br/>  - `name` - Name<br/>  - `display_name` - Display Name<br/>  - `resource_id` - The full id<br/>  - `resource` - The full azapi\_resource |
<!-- END_TF_DOCS -->
