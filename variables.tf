variable "location" {
  description = "Location of the network"
  default     = "canadacentral"
}

variable "sp_name" {
  description = "Name of the service principal."
}

variable "group_member" {
  type = list(string)
  description = "List of AAD group ID the the serviceprincipal should be member of"
  default = null
}