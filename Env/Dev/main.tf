module "azurerm_resource_group" {
  rg_name = var.rg_name
  source  = "../../Resorcegrope"
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  vnet_name  = var.vnet_name
  source     = "../../vnet"
}

module "azurerm_subnet" {
  depends_on  = [module.azurerm_virtual_network]
  subnet_name = var.subnet_name
  source      = "../../Subnet"
}
module "storage" {
  depends_on = [module.azurerm_resource_group]
  st_name    = var.st_name
  source     = "../../storage"

}
module "keyvault" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Keyvoult"
}

module "azurerm_linux_virtual_machine" {
  depends_on = [module.keyvault, module.azurerm_subnet]
  vm_name    = var.vm_name
  source     = "../../vm"
}
module "azurerm_bastion_host" {
  depends_on = [module.azurerm_virtual_network, module.azurerm_subnet]
  source     = "../../Bastion"
}
module "azurerm_subnet_network_security_group" {
  security_rule = var.security_rule
  depends_on = [module.azurerm_subnet]
  source     = "../../nsg"
}