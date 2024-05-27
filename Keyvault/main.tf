resource "azurerm_key_vault" "keyvaults" {
  name                        = "harshKeyvault7675"
  location                    = "westus"
  resource_group_name         = "keyvault"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
    ]

    storage_permissions = [
      "Get",
    ]
  } 
}
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_secret" "secrate" {
  name         = "username012"
  value        = "jeetadmin01"
  key_vault_id = azurerm_key_vault.keyvaults.id
}

resource "azurerm_key_vault_secret" "secrate1" {
  name         = "password012"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.keyvaults.id
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


