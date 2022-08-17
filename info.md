### Activity Logs ###
1. Azure Resource Manager resource provider operations
https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations

2. Azure Activity Log event schema
https://docs.microsoft.com/en-us/azure/azure-monitor/platform/activity-log-schema

# Postgresql Activity Log Alerts list
 Microsoft.DBforPostgreSQL/servers/securityAlertPolicies/read
 Microsoft.DBforPostgreSQL/servers/securityAlertPolicies/write
 Microsoft.DBforPostgreSQL/locations/securityAlertPoliciesOperationResults/read
 Microsoft.DBforPostgreSQL/servers/keys/read
 Microsoft.DBforPostgreSQL/servers/keys/write
 Microsoft.DBforPostgreSQL/servers/keys/delete
 Microsoft.DBforPostgreSQL/locations/serverKeyAzureAsyncOperation/read
 Microsoft.DBforPostgreSQL/locations/serverKeyOperationResults/read
 Microsoft.DBforPostgreSQL/servers/advisors/read
 Microsoft.DBforPostgreSQL/servers/advisors/recommendedActions/read
 Microsoft.DBforPostgreSQL/servers/advisors/recommendedActionSessions/action
 Microsoft.DBforPostgreSQL/servers/queryTexts/action
 Microsoft.DBforPostgreSQL/servers/queryTexts/read
 Microsoft.DBforPostgreSQL/servers/topQueryStatistics/read
 Microsoft.DBforPostgreSQL/servers/waitStatistics/read
 Microsoft.DBforPostgreSQL/servers/privateLinkResources/read
 Microsoft.DBforPostgreSQL/servers/privateEndpointConnections/read
 Microsoft.DBforPostgreSQL/servers/privateEndpointConnections/delete
 Microsoft.DBforPostgreSQL/servers/privateEndpointConnections/write
 Microsoft.DBforPostgreSQL/locations/privateEndpointConnectionOperationResults/read

# Activity log alert
 Error creating or updating metric alert "pg-connections" (resource group "rg-monitor"): insights.MetricAlertsClient#CreateOrUpdate: Failure responding to request: StatusCode=400 -- Original Error: autorest/azure: Service returned an error. Status=400 Code="BadRequest" Message="Scopes property is invalid. Only single resource is allowed for criteria type SingleResourceMultipleMetricCriteria. If you want to create an alert on multiple resources, use MultipleResourceMultipleMetricCriteria odata.type.

1. Multiple resources(Scopes) of same type e.g. Postgresql server => multiple metric criterias(COnditions)



### Metric Logs ###

1. Supported Metrics 
https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported