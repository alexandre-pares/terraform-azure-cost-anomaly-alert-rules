variable "name" {
  description = <<DESCRIPTION
  Name of the cost anomaly alert rule.

  Examples:

  - `dailyanomalybyresourcegroupforsubalzconnectivity`
  - `weeklyanomalybyresourcegroupforsubsharedaksdev`
  - `monthlyanomalybyresourcegroupforsubalzmanagement`

  DESCRIPTION

  type     = string
  nullable = false
}

variable "display_name" {
  description = <<DESCRIPTION
  Display name of the cost anomaly alert rule.

  If not set, `var.name` will be used.

  Examples:

  - `Daily cost anomaly for subscription alz-connectivity`
  - `Weekly cost anomaly for subscription shared-aks-dev`
  - `Monthly cost anomaly for subscription alz-management`

  DESCRIPTION

  type     = string
  nullable = true
  default  = null
}

variable "contact_emails" {
  description = <<DESCRIPTION
  List of email addresses to be added as contacts for the cost anomaly alert rules.

  Could be user email addresses or distribution lists.
  The email addresses must be valid and able to receive emails from `microsoft-noreply@microsoft.com`.

  Examples:

  ```hcl
  [
    "john.doe@example.com",
    "jane.doe@example.com"
  ]
  ```

  DESCRIPTION

  type     = list(string)
  nullable = false
}

variable "subject" {
  description = <<DESCRIPTION
  Email subject line for the cost anomaly alert rule. Length is limited to 70 characters.

  Examples:

  - `Cost anomaly detected for subscription alz-connectivity`
  - `Cost anomaly detected for EA billing account 12345678`
  - `Cost anomaly detected for MCA billing account John Doe`

  DESCRIPTION

  type     = string
  nullable = false

  validation {
    condition     = length(var.subject) <= 70
    error_message = "The subject line must be less than or equal to 70 characters."
  }
}

variable "language" {
  description = <<DESCRIPTION
  Language for the cost anomaly alert rule.

  Default is `en`.

  If an invalid language is provided, the resource may be update on each apply.

  Examples:

  - `en`
  - `fr`
  - `es`

  DESCRIPTION

  type     = string
  nullable = false
  default  = "en"
}

variable "subscription_id" {
  description = <<DESCRIPTION
  Subscription ID to be used for the cost anomaly alert rule.

  If not set, the subscription ID of the current context will be used.

  Examples:

  - `00000000-0000-0000-4000-000000000000`

  DESCRIPTION

  type     = string
  nullable = true
  default  = null
}

variable "start_date" {
  description = <<DESCRIPTION
  Start date of the cost anomaly alert rule.

  Examples:

  - `2026-08-07`

  DESCRIPTION

  type     = string
  nullable = false
}

variable "end_date" {
  description = <<DESCRIPTION
  End date of the cost anomaly alert rule.

  The end date can be up to 5 year from a start date.

  If not set, the maximum end date possible will be set. (5 years from the start date).

  Examples:

  - `2026-08-07`

  DESCRIPTION

  type     = string
  nullable = true
  default  = null
}
