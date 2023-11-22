resource "azurerm_resource_group" "rg103tg" {
  name     = "rg103"
  location = "east us"
}

resource "azurerm_storage_account" "sa102tg" {
  name                     = "sa102"
  resource_group_name      = azurerm_resource_group.rg103tg.name
  location                 = azurerm_resource_group.rg103tg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc101tg" {
  name                  = "sc101"
  storage_account_name  = azurerm_storage_account.sa102tg.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "ab101tg" {
  name                   = "samples.txt"
  storage_account_name   = azurerm_storage_account.sa102tg.name
  storage_container_name = azurerm_storage_container.sc101tg.name
  type                   = "Block"
  source                 = "samples01.txt"
}