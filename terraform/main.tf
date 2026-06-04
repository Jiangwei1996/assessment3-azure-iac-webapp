resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    project     = "assessment3"
    environment = "demo"
    managed_by  = "terraform"
  }
}

resource "azurerm_storage_account" "main" {
  name                     = "iacweb${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = {
    project     = "assessment3"
    environment = "demo"
    managed_by  = "terraform"
  }
}

resource "azurerm_storage_account_static_website" "main" {
  storage_account_id = azurerm_storage_account.main.id
  index_document     = "index.html"
}
resource "azurerm_storage_blob" "index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = abspath("${path.module}/../app/index.html")
  content_type           = "text/html"

  depends_on = [
    azurerm_storage_account_static_website.main
  ]
}
