variable "rg-name" {
  description = "El nombre del grupo de recursos"
  type        = string
}
variable "rg-location" {
  description = "La ubicación del grupo de recursos"
  type        = string
}

variable "pip-name" {
  type = string
}

variable "pip-allocation-method" {
  type    = string
  default = "Static"
}

variable "lb-name" {
  type = string
}

variable "frontip-name" {
  type    = string
  default = "PublicIPAddress"
}

variable "lb-backend-name" {
  type    = string
  default = "backendpool1"
}

variable "lb-backend-address-name" {
  type    = list(string)
  default = ["lb-backend-address-name1"]
}

variable "vnet-id" {
  type = string
}

variable "vm-ip" {
  type = list(number)

}