rg_name = {
  rg1 = {
    rgname   = "jeet"
    location = "eastus"
  }
  rg2 = {
    rgname   = "harshul"
    location = "westus"
  }
  rg3 = {
    rgname   = "keyvault"
    location = "westus"
  }
}
vnet_name = {
  vnet1 = {
    vnetname = "Jeetvnet"
    location = "eastus"
    rgname   = "jeet"
  }

  vnet2 = {
    vnetname = "harshulvnet"
    location = "westus"
    rgname   = "harshul"
  }
}
subnet_name = {
  subnet1 = {
    subnetname       = "frontend"
    rgname           = "jeet"
    vnetname         = "jeetvnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnetname       = "backend"
    rgname           = "jeet"
    vnetname         = "jeetvnet"
    address_prefixes = ["10.0.2.0/24"]
  }
  subnet3 = {
    subnetname       = "AzureBastionSubnet"
    rgname           = "jeet"
    vnetname         = "jeetvnet"
    address_prefixes = ["10.0.3.0/24"]
  }
}
st_name = {
  st1 = {
    stname                   = "storagejhs869"
    rgname                   = "harshul"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

vm_name = {
  vm1 = {
    nicname    = "nic1"
    location   = "eastus"
    rgname     = "jeet"
    ipname     = "ip1"
    vmname     = "jeetvm"
    subnetname = "frontend"
    vnetname   = "jeetvnet"
  }
  vm2 = {
    nicname    = "nic2"
    location   = "eastus"
    rgname     = "jeet"
    ipname     = "ip2"
    vmname     = "jeetvm01"
    subnetname = "frontend"
    vnetname   = "jeetvnet"
  }
}
security_rule = {
  rule1 = {
    name = "Inbound"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
  }
  rule2 = {
    name = "Outbound"
    priority = 101
    direction = "Outbound"
    access = "Allow"
    protocol = "Tcp"
  }
}