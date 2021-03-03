resource "azurerm_lb_probe" "user23-lb-probe" {
    resource_group_name = azurerm_resource_group.user23-rg.name
    loadbalancer_id = azurerm_lb.user23-lb.id
    name = "http-probe"
    protocol = "Http"
    request_path = "/"
    port = 80
}
