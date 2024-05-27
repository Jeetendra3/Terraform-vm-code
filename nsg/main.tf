resource "azurerm_network_security_group" "nsg" {
  name                = "jeetnsg"
  location            = "eastus"
  resource_group_name = "jeet"

   dynamic "security_rule" {
    for_each = var.security_rule
    content {
      
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = security_rule.value.direction
    access                     = security_rule.value.access
    protocol                   = security_rule.value.protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

   }
}
resource "azurerm_subnet_network_security_group_association" "nsg" {
  subnet_id                 = data.azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

data "azurerm_subnet" "subnet1" {
  name                 = "frontend"
  virtual_network_name = "jeetvnet"
  resource_group_name  = "jeet"
}