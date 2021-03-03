resource "azurerm_lb" "user23-lb" {
name = "user23lb"
location = azurerm_resource_group.user23-rg.location
resource_group_name = azurerm_resource_group.user23-rg.name
frontend_ip_configuration {
  name = "user23PublicIPAddress"
  public_ip_address_id = azurerm_public_ip.user23-publicip.id
}
}
