variable "rgname"{
    type = string
    description = "used for naming resource group"
}

variable "location"{
    type = string
    description = "used for selecting location"
}

variable "prefix" {
  type = string
  description = "The prefix used for all resources in this example"
}

variable "vnet_cidr_prefix" {
  type = string
  description = "This variable defines address space for vnet"
}

variable "subnet_cidr_prefix" {
  type = string
  description = "This variable defines address space for subnetnet"
}

variable "os" {
  type = string
  description = "This variable defines Operating system for app service plan"
}

variable "sku" {
  type = string
  description = "This variable defines SKU for app service plan"
}

variable "planname" {
  type = string
  description = "This variable defines app service plan"
}

variable "webappservice" {
  type = string
  description = "This variable defines aweb app aervice name"
}
