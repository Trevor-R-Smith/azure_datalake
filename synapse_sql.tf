resource "azurerm_template_deployment" "example" {
  name = "acctesttemplate-01"
  resource_group_name = azurerm_resource_group.example.name
  template_body = file("${path.module}/synapse.json")
  deployment_mode = "Incremental"
  parameters = {
    "collation" = var.collation
    "databaseName" = "testsynapse"
    "skuName" = var.synapse_skuName
    "serverLocation" = azurerm_resource_group.example.location
    "serverName" = azurerm_sql_server.example.name
  }

  depends_on = [azurerm_sql_server.example, azurerm_sql_database.example]
}
