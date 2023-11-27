provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "example_page" {
  name     = "var.resource_group"
  location = "var.location"
}

resource "azurerm_storage_account" "example_page" {
  name                     = "example_page_storageaccount"
  resource_group_name      = azurerm_resource_group.example_page.name
  location                 = azurerm_resource_group.example_page.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example_page" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.example_page.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "example_page" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.example_page.name
  storage_container_name = azurerm_storage_container.example_page.name
  type                   = "Block"
  source                 = "index.html"
}

resource "azurerm_storage_blob" "error" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.example_page.name
  storage_container_name = azurerm_storage_container.example_page.name
  type                   = "Block"
  source                 = "404.html"
}

resource "azurerm_storage_blob" "example_page_css" {
  name                   = "style.css"
  storage_account_name   = azurerm_storage_account.example_page.name
  storage_container_name = azurerm_storage_container.example_page.name
  type                   = "Block"
  source                 = "style.css"
}

output "static_website_endpoint" {
  value = azurerm_storage_account.example_page.primary_web_endpoint
}
