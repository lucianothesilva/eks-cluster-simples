terraform {
  
  backend "s3" {
    region="us-east-2"
    bucket="lu-test-eks-bucket"
    key="lu-test-state-stg"
  }
}

provider "aws" {
  region  = "us-east-2"
}

module "network" {
  source = "../modules/network"
  tags = {
    Env = basename(path.cwd)
  }
}

module "cluster" {
  source         = "../modules/cluster"
  vpc_id         = module.network.vpc_id
  eks_subnet_ids = module.network.eks_subnet_ids
  cluster_name   = module.network.cluster_name

  tags = {
    Env = basename(path.cwd)
  }
}

module "worknodes" {
  source         = "../modules/worknodes"
  eks_subnet_ids = module.network.eks_subnet_ids
  cluster_name   = module.network.cluster_name

  worknodes = 1
  worknode_desired_size = 2
  worknode_max_size = 2
  worknode_min_size = 2

  tags = {
    Env = basename(path.cwd)
  }
}
