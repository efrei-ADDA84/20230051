
variable "resource_group_location" {
  type        = string
  default     = "france central"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "ADDA84-CTP"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "identifiant_efrei" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "20230051"  
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "devops"
}

