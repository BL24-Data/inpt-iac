terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}

module "network" {
  source       = "./modules/network"
  vpc_cidr     = "10.3.0.0/16"
  environment  = "dev"
  project_name = "inpt-3tiers"
}

module "compute" {
  source       = "./modules/compute"
  vpc_id       = module.network.vpc_id
  subnet_ids   = module.network.public_subnet_ids
  environment  = "dev"
  project_name = "inpt-3tiers"
}

module "storage" {
  source       = "./modules/storage"
  environment  = "dev"
  project_name = "inpt-3tiers"
}