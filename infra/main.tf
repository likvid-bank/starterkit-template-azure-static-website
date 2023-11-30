# this resource group was set up by the starterkit building block
data "azurerm_resource_group" "app" {
  name = "app"
}

resource "azurerm_static_site" "test" {
  name                = "example"
  location            = data.azurerm_resource_group.app.location
  resource_group_name = data.azurerm_resource_group.app.name
}

