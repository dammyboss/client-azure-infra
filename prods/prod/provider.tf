# # We strongly recommend using the required_providers block to set the
# # Azure Provider source and version being used
# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=2.46.0"
#     }
    
#   }
//  backend "azurerm" {
//    resource_group_name  = "TerraformEchonous"
//    storage_account_name = "terraformechonous"
//    container_name       = "meded"
//    key                  = "terraform.tfstate"
//  }
}

# Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}
#   subscription_id = ""
# //  client_id       = ""
# //  client_secret   = var.client_secret
#   tenant_id       = ""
# }

//provider "helm" {
//  kubernetes {
//    # load_config_file       = "false"
//    host                   = module.aks-acr.host
//    client_certificate     = base64decode(module.aks-acr.client_certificate)
//    client_key             = base64decode(module.aks-acr.client_key)
//    cluster_ca_certificate = base64decode(module.aks-acr.client_certificate)
//  }
//}

###########################
## Azure Provider - Main ##
###########################

# Define Terraform provider
terraform {
  required_version = ">= 0.12"
}

# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  version     = ">= 2.15.0"
  features {}
}
