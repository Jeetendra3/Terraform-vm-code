data "azurerm_subnet" "subnet" {
    for_each = var.vm_name
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}

data "azurerm_key_vault_secret" "username" {
  name         = "username012"
  key_vault_id = data.azurerm_key_vault.keyvaults.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password012"
  key_vault_id = data.azurerm_key_vault.keyvaults.id
}

data "azurerm_key_vault" "keyvaults" {
  name                = "harshKeyvault7675"
  resource_group_name = "keyvault"
}