/*terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}*/

module "module_test" {
    source = "./modules"
    prefix = "test"
    vnet_cidr_prefix = "10.60.0.0/16"
    subnet_cidr_prefix = "10.60.1.0/24"
    rgname = "TestRG"
    location="eastus"
    os = "Windows"
    sku = "B1"
    planname= "dotnet-plan-test"
    webappservice = "dotnet-app-tes"
}