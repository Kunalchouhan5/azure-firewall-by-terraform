variable "tenant_id" {
  type = string
  default = ""    # required tenant id 
}

variable "subscription" {
  type = string
  default = ""   # requiredf Subscription id 
}

variable "rg" {
  type = string
  default = "Fw-test-rg"
  description = "Name of app rg"
}

variable "location" {
  type = string
  default = "Central India"
  description = "name of location"
}

variable "Vnet-name" {
  type = string
  default = "test-VNet"
  description = "Name of Vnet"
}

variable "address_space" {
  type = set(string)
  default = ["10.1.0.0/16"]
  description = "address space of virtual network"
}

variable "Subnet-name" {
  type = string
  default = "AzureFirewallSubnet"
  description = "name of subnet"
}

variable "address_prefixes" {
  type = list(string)
  default = [ "10.1.0.0/26" ]
  description = "Value of address prefixes"
}

variable "public-ip" {
  type = string
  default = "FW-pip"
  description = "Firewall public IP"
}

variable "firewall_name" {
  type = string
  default = "Firewall-01"
}

