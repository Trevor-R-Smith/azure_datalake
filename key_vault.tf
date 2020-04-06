resource "azurerm_key_vault" "example" {
  name = "dbras-vault"
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled = true
  purge_protection_enabled = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }

  tags = {
    environment = "Testing"
  }
}

//resource "null_resource" "databricks_token" {
//  triggers = {
//    workspace = azurerm_databricks_workspace.example.id
//    key_vault = azurerm_key_vault.example.id
//  }
//  provisioner "local-exec" {
//    command = "${path.module}/generate-pat-token.sh"
//    environment = {
//      RESOURCE_GROUP = azurerm_resource_group.example.name
//      DATABRICKS_WORKSPACE_RESOURCE_ID = azurerm_databricks_workspace.example.id
//      KEY_VAULT = azurerm_key_vault.example.name
//      SECRET_NAME = "DATABRICKS-TOKEN"
//      DATABRICKS_ENDPOINT = "https://${azurerm_databricks_workspace.example.location}.azuredatabricks.net"
//      # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID are already
//      # present in the environment if you are using the Terraform
//      # extension for Azure DevOps or the starter from
//      # https://github.com/algattik/terraform-azure-pipelines-starter.
//      # Otherwise, provide them as additional variables.
//    }
//  }
//}