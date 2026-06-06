# No-op update to refresh GitHub Actions status
terraform {
  required_version = ">= 1.0.0"

  backend "azurerm" {
    resource_group_name  = "rg-assessment3-tfstate"
    storage_account_name = "tfstate612jw115538"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}
