resource "azurerm_sql_server" "example" {
  name                         = "example-server"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = var.sql_server_version
  administrator_login          = var.sql_adminstrator_login
  administrator_login_password = var.sql_adminstrator_login_password


}

resource "azurerm_sql_database" "example" {
  name                             = "exampledb"
  resource_group_name              = azurerm_resource_group.example.name
  location                         = azurerm_resource_group.example.location
  server_name                      = azurerm_sql_server.example.name
  requested_service_objective_name = "S0"
  collation                        = var.collation
  max_size_bytes                   = "268435456000"
  create_mode                      = "Default"
}

resource "azurerm_sql_firewall_rule" "example" {
  name                = "SQLFirewallRule"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  start_ip_address    = "10.5.3.0"
  end_ip_address      = "10.5.3.0"
}