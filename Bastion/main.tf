resource "azurerm_public_ip" "pip" {
  name                = "Bastion_pip"
  location            = "eastus"
  resource_group_name = "jeet"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "Bastion_Host" {
  name                = "Bastion_Host"
  location            = "eastus"
  resource_group_name = "jeet"

  ip_configuration {
    name                 = "bastionip"
    subnet_id            = data.azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

data "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "jeetvnet"
  resource_group_name  = "jeet"
}