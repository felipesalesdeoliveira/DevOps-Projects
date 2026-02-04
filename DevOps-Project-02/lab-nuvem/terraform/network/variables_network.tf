################ RESOURCE GROUP #################

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "lab_project_02"
}

################ BASTION #################

variable "bastion_vnet_location" {
  description = "Location of the bastion_vnet"
  type = string
  default = "eastus"
}

################ APP #################

variable "app_vnet_location" {
  description = "Location of the app_vnet"
  type = string
  default = "eastus"
}

############ SUBNETES  PRIVATE #############

variable "app_subnets" {
  type = map(string)
  default = { s1 = "172.32.1.0/24", s2 = "172.32.2.0/24" }
}