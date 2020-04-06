resource "azurerm_network_ddos_protection_plan" "example" {
  name                = "ddospplan1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.5.0.0/16"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.example.id
    enable = true
  }

}

resource "azurerm_subnet" "example" {
  name                                          = "example-subnet"
  resource_group_name                           = azurerm_resource_group.example.name
  virtual_network_name                          = azurerm_virtual_network.example.name
  address_prefix                                = "10.5.1.0/24"
  enforce_private_link_service_network_policies = false
  service_endpoints                             =["Microsoft.KeyVault"]
}

resource "azurerm_subnet" "private_link_sql" {
  name                                          = "private-link-synapse"
  resource_group_name                           = azurerm_resource_group.example.name
  virtual_network_name                          = azurerm_virtual_network.example.name
  address_prefix                                = "10.5.3.0/24"
  enforce_private_link_endpoint_network_policies = true
}
