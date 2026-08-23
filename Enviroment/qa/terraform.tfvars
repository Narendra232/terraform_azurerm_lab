rgs = {

  rg1 = {
    name     = "rg1"
    location = "East US"
  }
  rg2 = {
    name     = "rg2"
    location = "East US"
  }
}
storage = {
  stg1 = {
    name                     = "storageaccount123654"
    resource_group_name      = "rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}
cnt = {
  cnt1 = {
    name = "container123654"

    storage_account_name = "storageaccount123654"
    resource_group_name  = "rg1"

    container_access_type = "private"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet1"
    address_space       = ["10.0.0.0/16"]
    location            = "East US"
    resource_group_name = "rg1"
  }
}

subnets = {
  subnet1 = {
    name                 = "subnet1"
    location             = "East US"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "subnet2"
    location             = "East US"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }
  azurebastion = {
    name                 = "AzureBastionSubnet"
    location             = "East US"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

nics = {
  nic1 = {
    name                          = "nic1"
    location                      = "East US"
    resource_group_name           = "rg1"
    virtual_network_name          = "vnet1"
    name_ip_configuration         = "ipconfig1"
    subnet_name                   = "subnet1"
    private_ip_address_allocation = "Dynamic"
    pip_name                      = "pip1"
  }
}
ips = {
  ip1 = {
    name                = "pip1"
    location            = "East US"
    resource_group_name = "rg1"
    allocation_method   = "Dynamic"
  }
}
vms = {
  vm1 = {
    name                  = "vm1"
    location              = "East US"
    resource_group_name   = "rg1"
    network_interface_ids = ["${azurerm_network_interface.nic1.id}"]
    vm_size               = "Standard_DV2s_v3"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

    storage_os_disk = {
      name              = "myosdisk1"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }

    os_profile = {
      computer_name  = "hostname"
      admin_username = "adminuser"
      admin_password = "Password1234!"
    }

    os_profile_linux_config = {
      disable_password_authentication = false
    }
  }
}

