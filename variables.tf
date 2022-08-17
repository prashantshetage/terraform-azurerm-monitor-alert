// Required Variables
//**********************************************************************************************
# Common
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resources"
}

# Action Group
variable "action_group_name" {
  type        = string
  description = "(Required) The name of the Action Group"
}
variable "short_name" {
  type        = string
  description = "(Required) The short name of the action group. This will be used in SMS messages"
}


variable "metric_alerts" {
  type = map(object({
    name                = string
    resource_group_name = string
    scopes              = list(string)
    description         = string
    metric_criterias = map(object({
      metric_namespace = string
      metric_name      = string
      aggregation      = string
      operator         = string
      threshold        = number
      dimension = map(object({
        name     = string
        operator = string
        values   = list(string)
      }))
    }))
  }))
  description = "(Required) One or more criteria blocks"
  default     = {}
}


variable "log_alerts" {
  type = map(object({
    name                = string
    resource_group_name = string
    scopes              = list(string)
    description         = string
    log_criterias = object({
      resource_id       = string
      category          = string
      operation_name    = string
      level             = string
      status            = string
      resource_provider = string
      resource_type     = string
      resource_group    = string
      caller            = string
      sub_status        = string
    })
  }))
  description = "(Required) A criteria block"
  default     = {}
}
//**********************************************************************************************



// Optional Variables
//**********************************************************************************************
# Common
variable "tags" {
  type        = map(any)
  description = "(Optional) A mapping of tags to assign to the resource"
}

# Action Group
variable "action_group_enabled" {
  type        = bool
  description = "(Optional) Whether this action group is enabled. If an action group is not enabled, then none of its receivers will receive communications"
  default     = true
}
variable "email_receivers" {
  type = map(object({
    name                    = string
    email_address           = string
    use_common_alert_schema = bool
  }))
  description = "(Optional) One or more email_receiver blocks"
  default = {
    admin = {
      name                    = "administrators"
      email_address           = "shetageprashant@gmail.com"
      use_common_alert_schema = false
    }
  }
}


variable "metric_alert_enabled" {
  type        = bool
  description = "(Optional) Should this Metric Alert be enabled?"
  default     = true
}
variable "auto_mitigate" {
  type        = bool
  description = "(Optional) Should the alerts in this Metric Alert be auto resolved?"
  default     = true
}
variable "frequency" {
  type        = string
  description = "(Optional) The evaluation frequency of this Metric Alert, represented in ISO 8601 duration format"
  default     = "PT1M"
}
variable "severity" {
  type        = number
  description = " (Optional) The severity of this Metric Alert. Possible values are 0, 1, 2, 3 and 4"
  default     = 3
}
variable "window_size" {
  type        = string
  description = "(Optional) The period of time that is used to monitor alert activity, represented in ISO 8601 duration format"
  default     = "PT5M"
}
variable "metric_actions" {
  type = map(object({
    action_group_id    = string
    webhook_properties = map(string)
  }))
  description = "(Optional) One or more action blocks"
  default = {
    action1 = {
      action_group_id    = null
      webhook_properties = null
    }
  }
}


variable "log_actions" {
  type = map(object({
    action_group_id    = string
    webhook_properties = map(string)
  }))
  description = "(Optional) One or more action blocks"
  default = {
    action1 = {
      action_group_id    = null
      webhook_properties = null
    }
  }
}
//**********************************************************************************************




// Local Values
//**********************************************************************************************
locals {
  timeout_duration  = "1h"
  monitoring_scopes = ["${azurerm_postgresql_server.postgresql.id}"]

}

//**********************************************************************************************