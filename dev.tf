terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

module "module_dev" {
    source = "./modules"
    prefix = "dev"
    vnet_cidr_prefix = "10.20.0.0/16"
    subnet_cidr_prefix = "10.20.1.0/24"
    rgname = "DevRG" 
    location ="eastus"
    os = "Windows"
    sku = "B1"
    planname= "dotnet-plan-dev"
    webappservice = "dotnet-app-dev"
}