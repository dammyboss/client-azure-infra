# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
    
    provider "azuredevops" {
  org_service_url = var.ado_org_service_url
  # Authentication through PAT defined with AZDO_PERSONAL_ACCESS_TOKEN 
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
  subscription_id = ""
//  client_id       = ""
//  client_secret   = var.client_secret
  tenant_id       = ""
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

