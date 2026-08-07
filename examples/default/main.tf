module "daily_cost_anomaly_alert_rule" {
  source = "../.."

  name           = "dailyanomalybyresourcegroupforsubsandbox"
  display_name   = "Daily cost anomaly for subscription sandbox"
  contact_emails = ["john.doe@example.com"]
  subject        = "Daily cost anomaly alert for subscription sandbox"
  start_date     = "2026-08-07"
  language       = "en"
}
