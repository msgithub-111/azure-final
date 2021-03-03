resource "azurerm_lb_backend_address_pool" "user23-bpepool" {
    resource_group_name = azurerm_resource_group.user23-rg.name
    loadbalancer_id = azurerm_lb.user23-lb.id
    name = "user23-BackEndAddressPool"
}
