resource "azurerm_storage_account" "storage" {
    for_each = var.st_name
  name                     = each.value.stname
  resource_group_name      = each.value.rgname
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}