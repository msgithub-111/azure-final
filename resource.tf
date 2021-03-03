resource "azurerm_resource_group" "user23-rg" {
    name     = "user23rg"
    location = "koreacentral"

    tags = {
        environment = "Terraform Demo"
    }
}
