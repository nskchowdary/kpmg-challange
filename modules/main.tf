terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.48.0"
    }
  }
}

provider "azurerm" {
  features {} 
  /*subscription_id = var.subid 
  tenant_id  = var.tenant 
  client_id = var.spid
  client_secret = var.spsecret*/
}

resource "azurerm_resource_group" "rg" {
    name     = "${var.rgname}"
    location = "${var.location}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["${var.vnet_cidr_prefix}"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["${var.subnet_cidr_prefix}"] 
}

resource "azurerm_service_plan" "plan" {
  name                = var.planname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = var.os
  sku_name            = var.sku
}

resource "azurerm_windows_web_app" "webapp" {
  name                  = var.webappservice 
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.plan.id
  https_only            = true
  site_config {   
    minimum_tls_version = "1.2"
    always_on           = true
    ip_restriction {
      virtual_network_subnet_id = azurerm_subnet.subnet.id
    }
  }
}