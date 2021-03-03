resource "azurerm_subnet" "user23-subnet1" {
    name = "user23-mysubnet1"
    resource_group_name = azurerm_resource_group.user23-rg.name
    virtual_network_name = azurerm_virtual_network.user23-net.name
    address_prefixes = ["23.0.1.0/24"]
}
