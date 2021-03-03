resource "azurerm_lb_rule" "lbrule" {
    resource_group_name = azurerm_resource_group.user23-rg.name
    loadbalancer_id = azurerm_lb.user23-lb.id
    name = "http"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    backend_address_pool_id = azurerm_lb_backend_address_pool.user23-bpepool.id
    frontend_ip_configuration_name = "user23PublicIPAddress"
    probe_id = azurerm_lb_probe.user23-lb-probe.id
}
