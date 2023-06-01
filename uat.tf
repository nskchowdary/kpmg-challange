/*terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}*/

module "module_uat" {
    source = "./modules"
    prefix = "uat"
    vnet_cidr_prefix = "10.30.0.0/16"
    subnet_cidr_prefix = "10.30.1.0/24"
    rgname = "UATRG"
    location="eastus"
    os = "Windows"
    sku = "B1"
    planname= "dotnet-plan-uat"
    webappservice = "dotnet-app-uat"
}