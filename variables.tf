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