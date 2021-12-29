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
  subscription_id = "0134f13c-bdf6-4d08-95c4-67bc73fd7c35"
//  client_id       = ""
//  client_secret   = var.client_secret
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

