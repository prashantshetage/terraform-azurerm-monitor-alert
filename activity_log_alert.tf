// Set up Azure Monitor Alert For Activity Logs
//****************************************************************************************
resource "azurerm_monitor_activity_log_alert" "log_alert" {
  for_each            = var.log_alerts
  name                = each.value.name
  resource_group_name = coalesce(each.value.resource_group_name, var.resource_group_name)
  scopes              = coalesce(each.value.scopes, local.monitoring_scopes)
  description         = each.value.description

  criteria {
    resource_id       = coalesce(each.value.log_criterias.resource_id, element(local.monitoring_scopes, 0))
    category          = each.value.log_criterias.category
    operation_name    = each.value.log_criterias.operation_name
    level             = each.value.log_criterias.level
    status            = each.value.log_criterias.status
    resource_provider = each.value.log_criterias.resource_provider
    resource_type     = each.value.log_criterias.resource_type
    resource_group    = each.value.log_criterias.resource_group
    caller            = each.value.log_criterias.caller
    sub_status        = each.value.log_criterias.sub_status
  }

  dynamic "action" {
    for_each = var.log_actions
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