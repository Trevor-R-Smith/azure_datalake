resource "azurerm_data_factory" "example" {
  name                = "dbras-test-factory"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.example.name
}

data "azurerm_client_config" "current" {
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "example" {
  name                  = "example"
  resource_group_name   = azurerm_resource_group.example.name
  data_factory_name     = azurerm_data_factory.example.name
  service_principal_id  = data.azurerm_client_config.current.client_id
  service_principal_key = "exampleKey"
  tenant                = data.azurerm_client_config.current.tenant_id
  url                   = "https://datalakestoragegen2"
}