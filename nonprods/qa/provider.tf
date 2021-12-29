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
  subscription_id = "a9e90d45-84f4-48e9-9db6-2b1edaff8e1a"
//  client_id       = ""
//  client_secret   = var.client_secret
  tenant_id       = "755ae5a0-10d3-4695-a38f-5dca8d3faaca"
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

