data "azapi_client_config" "current" {
}

locals {
  view_id         = "/subscriptions/${local.subscription_id}/providers/Microsoft.CostManagement/views/ms:DailyAnomalyByResourceGroup"
  display_name    = coalesce(var.display_name, var.name)
  subscription_id = coalesce(var.subscription_id, data.azapi_client_config.current.subscription_id)
  language        = var.language
  start_date      = "${var.start_date}T00:00:00Z"
  end_date = coalesce(
    var.end_date, formatdate(
      "YYYY-MM-DD'T'00:00:00Z",
      timeadd(local.start_date, "43800h") # + 5 years
    )
  )
}
