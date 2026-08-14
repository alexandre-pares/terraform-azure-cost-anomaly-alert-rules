# Microsoft.CostManagement scheduledActions
# Learn more: https://learn.microsoft.com/en-us/azure/templates/microsoft.costmanagement/scheduledactions
resource "azapi_resource" "this" {
  type      = "Microsoft.CostManagement/scheduledActions@2025-03-01"
  name      = var.name
  parent_id = "/subscriptions/${local.subscription_id}"

  body = {
    kind = "InsightAlert"

    properties = {
      viewId      = local.view_id
      displayName = local.display_name
      schedule = {
        frequency = "Daily" # The schedule frequency for insight alert can only be daily
        startDate = local.start_date
        endDate   = local.end_date
      }
      notification = {
        subject  = var.subject
        to       = var.contact_emails
        language = local.language
      }
      notificationEmail = try(var.notification_email, var.contact_emails[0])
      status            = "Enabled"
    }
  }
}
