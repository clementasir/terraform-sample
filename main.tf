
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"



    }
  }
}

module "cd_vpc" {
  source               = "./modules/cd_vpc"
  cidr_vpc             = var.cidr_vpc
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones

}

##https://registry.terraform.io/modules/claranet/vpc-modules/aws/latest/submodules/vpc

#########################################################################################
###############################################
 
 
 module "ec2"{

  source = "./modules/cd_ec2"

  count           = 1
  instance_ami    = var.instance_ami
  instance_type   = var.instance_type
  instance_count  = var.instance_count
  key_name        = var.key_name
  private_subnets  = module.cd_vpc.private_subnets
  region          = var.region
  profile         = var.profile
  environment     = var.environment
}
