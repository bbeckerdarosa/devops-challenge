variable "aws_access_key" {
  description = "Please, insert your AWS access key from your account"
  type        = string
}

variable "aws_secret_key" {
  description = "Please, insert your AWS secret key from your account"
  type        = string
}

variable "vpc_id" {
  description = "Please, insert VPC id from your AWS account"
  type        = string
}

variable "subnets"       { 
  description = "Please, insert the list of subnets from your VCP id. Ex: [subnet_id1, subnet_id2, subnet_id3]"
  type        = list(string)
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "cluster-fargate" {
  source                = "../../modules/cluster-fargate/"
  
  env                   = "stage"
  region                = "us-east-1"
  cluster_name          = "fargate"
  launch_type           = "FARGATE"
  container_name        = "fargate-application-version"
  container_port        = 3000
  network_mode          = "awsvpc"
  vpc_id                = var.vpc_id
  subnets               = var.subnets
  cpu                   = 256
  memory                = 512
  desired_count         = 1
}

output "fargate_alb_dns_name" {
  value = "${module.cluster-fargate.fargate_alb_dns_name}"
}