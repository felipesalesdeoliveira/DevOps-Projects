terraform {
  required_version = ">= 1.5.0"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

  }
  backend "azurerm" {
    resource_group_name  = "lab_project_02"         # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "storage-account"        # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "container-storage"      # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}