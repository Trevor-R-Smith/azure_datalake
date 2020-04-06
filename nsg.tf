resource "azurerm_network_security_group" "example" {
  name                = "TestSecurityGroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "1024-65535"
    destination_port_range     = "1433"
    source_address_prefixes      = ["10.5.3.0/24"]
    destination_address_prefixes = ["10.5.3.0/24"]
  }

  tags = {
    environment = "Production"
  }
}