locals {
  common_tags = {
    Project         = "Automation project - Assignment 1 "
    Name            = "Hamidur Rahman"
    ExpirationDate = "2022-06-30"
    Environment  = "Lab"
  }
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.92.0"
    }
  }
  required_version = "~> 1.1.2"
}

provider "azurerm" {
  features {}
}

