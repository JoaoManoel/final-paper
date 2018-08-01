variable "access_key" {}
variable "secret_key" {}

variable "public_key_pair" {}

variable "region" {
  default = "sa-east-1"
}

variable "igw_zones" {
  default = {
    "0" = "sa-east-1a"
  }
}

variable "ngw_zones" {
  default = {
    "0" = "sa-east-1b"
    "1" = "sa-east-1c"
  }
}

variable "ami" {
  default = "ami-67fca30b"
}

variable "instance_type" {
  default = "t2.nano"
}

variable "encrypt" {
  default = "+EmqFq3LOIPPrb0tDEyPIA=="
}

variable "server_count" {
  default = 1
}

variable "rabbitmq_servers_count" {
  default = 2
}
