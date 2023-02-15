# Instance variables 
##https://www.devopsschool.com/blog/terraform-variable-map-type-explained/
# common variables

variable "profile" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

 


variable "instance_ami" {
  type = map(any)
  default = {
    "us-east-1" = "ami-0aa7d40eeae50c9a9"
    "us-west-2" = "ami-06e85d4c3149db26a"
  }
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_count" {
  type = string
}

variable "cidr_vpc" {
  type = string
}

variable "public_subnets_cidr" {
  type = list(string)
}

variable "private_subnets_cidr" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}



variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}


