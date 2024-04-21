data "azurerm_resource_group" "example" {
  name     = var.resource_group_name
}


data "azurerm_virtual_network" "example" {
  name                = "network-tp4"
  resource_group_name = data.azurerm_resource_group.example.name

}

data "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = data.azurerm_resource_group.example.name
  virtual_network_name = data.azurerm_virtual_network.example.name
}

resource "azurerm_network_interface" "example" {
  name                = "nic-${var.identifiant_efrei}"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}


# Create virtual machine
resource "azurerm_linux_virtual_machine" "example" {
  name                  = "devops-${var.identifiant_efrei}"
  location              = data.azurerm_resource_group.example.location
  resource_group_name   = data.azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  size                  = "Standard_D2s_v3"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
    
    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts-gen2"
        version   = "latest"
    }

    computer_name  = "${var.identifiant_efrei}"
    admin_username = var.username
    
    admin_ssh_key {
        username   = var.username
        public_key = tls_private_key.tls_key.public_key_openssh
    }

    disable_password_authentication = true

}




