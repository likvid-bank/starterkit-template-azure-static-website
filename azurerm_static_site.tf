resource "azurerm_resource_group" "example_page" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_storage_account" "example_page" {
  name                     = "examplepagestorageaccount"
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

resource "azurerm_storage_blob" "index" {
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

resource "azurerm_storage_blob" "style" {
  name                   = "style.css"
  storage_account_name   = azurerm_storage_account.example_page.name
  storage_container_name = azurerm_storage_container.example_page.name
  type                   = "Block"
  source                 = "style.css"
}

resource "azurerm_static_site" "example_page" {
  name                = "example-page"
  location            = azurerm_resource_group.example_page.location
  resource_group_name = azurerm_resource_group.example_page.name

  app_location {
    default = "/"
    error   = "/"
  }

  build_configuration {
    source_location = "/"
    output_location = "/$web"
  }

  repository_url = var.github_repo_url
}

output "static_website_endpoint" {
  value = azurerm_static_site.example_page.default_hostname
}
