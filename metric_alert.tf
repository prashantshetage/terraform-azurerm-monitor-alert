// Set up Azure Monitor Alert For Metrics
//**********************************************************************************************
resource "azurerm_monitor_metric_alert" "metric_alert" {
  for_each            = var.metric_alerts # Add condition against local.monitoring_scopes
  name                = each.value.name
  resource_group_name = coalesce(each.value.resource_group_name, var.resource_group_name)
  scopes              = coalesce(each.value.scopes, local.monitoring_scopes)
  description         = each.value.description

  enabled       = var.metric_alert_enabled
  auto_mitigate = var.auto_mitigate
  frequency     = var.frequency
  severity      = var.severity
  window_size   = var.window_size


  dynamic "criteria" {
    for_each = each.value.metric_criterias
    content {
      metric_namespace = criteria.value.metric_namespace
      metric_name      = criteria.value.metric_name
      aggregation      = criteria.value.aggregation
      operator         = criteria.value.operator
      threshold        = criteria.value.threshold

      dynamic "dimension" {
        for_each = criteria.value.dimension
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
    }
  }

  dynamic "action" {
    for_each = var.metric_actions
    content {
      action_group_id    = coalesce(action.value.action_group_id, azurerm_monitor_action_group.action_group.id)
      webhook_properties = action.value.webhook_properties
    }
  }

  # Change to var.tags
  tags = var.tags

  timeouts {
    create = local.timeout_duration
    delete = local.timeout_duration
  }
}
//****************************************************************************************