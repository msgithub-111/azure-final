resource "azurerm_virtual_machine" "web2" {
    name                  = "user23web2"
    location              = azurerm_resource_group.user23-rg.location
    resource_group_name   = azurerm_resource_group.user23-rg.name
    availability_set_id   = azurerm_availability_set.avset.id
    network_interface_ids = [azurerm_network_interface.nic2.id]
    vm_size               = "Standard_D2_v3"

    storage_os_disk {
        name              = "myOsDisk2"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }
    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

 os_profile {
        computer_name  = "user23web2"
        admin_username = "msheo"
        admin_password = "12345678Qwer"
	custom_data= file("web.sh")
    }

 os_profile_linux_config {
        disable_password_authentication = false
        ssh_keys {
            path = "/home/msheo/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMBFQalWlDZmPekiE3cHxvk6R+gbS54cJ0bwVXknrpgsOBUqBqjn64H9ZTfF58H7aOwlOwFzTYPnLGBpZ6zfeoBE0cFEUc1sxK64hV9+HKsjkjD5v4HRBB9IZIhB6TwJL9+66/sTDjv1zKCSyhLmFSJQKKIxA2cH/VMJQ/fE8FZ4ZUWUelUBmbMU93E99Scnz1yruR5LRHHgwrmaYzD/RwgG6TnieWdFPvy2M/Um/mwYZHXJC8So7DrYQSUhmR1dcsWkO+vsmX3JHkxJ2Ks7JsNXeOSFEFUVF7H/xT1PH4w6ylZmN4NQSrDjoLNe9jrjP+0b5KMN8O8880MHW3YoKn msheo@user23-admin-vm"
        }
    }
    boot_diagnostics {
        enabled     = "true"
        storage_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "Terraform Demo"
    }
}

