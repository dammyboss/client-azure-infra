# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
//  backend "azurerm" {
//    resource_group_name  = "TerraformEchonous"
//    storage_account_name = "terraformechonous"
//    container_name       = "meded"
//    key                  = "terraform.tfstate"
//  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "85c7908d-8028-4894-af5d-1991ee8f0450"
  client_id       = "b42b410e-bad5-40e7-af1d-6a224e769ad1"
  client_secret   = "lg1mt8HEOxiZOSQSoOny4-GxkCH8Mp0KO7"
  tenant_id       = "37bb0008-2586-4514-a753-d1092d7259f2"
}

//provider "helm" {
//  kubernetes {
//    # load_config_file       = "false"
//    host                   = module.aks-acr.host
//    client_certificate     = base64decode(module.aks-acr.client_certificate)
//    client_key             = base64decode(module.aks-acr.client_key)
//    cluster_ca_certificate = base64decode(module.aks-acr.client_certificate)
//  }
//}
