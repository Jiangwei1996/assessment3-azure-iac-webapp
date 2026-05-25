output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.main.name
}

output "storage_account_name" {
  description = "The name of the created storage account"
  value       = azurerm_storage_account.main.name
}

output "static_website_url" {
  description = "The primary endpoint of the static website"
  value       = azurerm_storage_account.main.primary_web_endpoint
}
