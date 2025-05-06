output hostname {
  value = azurerm_static_web_app.test.default_host_name
}

output api_key {
  value = azurerm_static_web_app.test.api_key
  sensitive = true
}