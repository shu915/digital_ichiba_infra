variable "public_subnet_ids" {
  type = list(string)
}

variable "app_security_group_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "container_name" {
  type    = string
  default = "digital-ichiba"
}

variable "container_port" {
  type    = number
  default = 3000
}


