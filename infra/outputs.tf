output hostname {
  value = azurerm_static_site.test.default_host_name
}

output api_key {
  value = azurerm_static_site.test.api_key
  sensitive = true
}