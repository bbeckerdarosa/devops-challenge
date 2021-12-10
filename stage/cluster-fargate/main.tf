variable "aws_access_key" {
  description = "Please, insert your AWS access key from your account"
  type        = string
}

variable "aws_secret_key" {
  description = "Please, insert your AWS secret key from your account"
  type        = string
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
  cpu                   = 256
  memory                = 512
  desired_count         = 1
  container_image       = "bbeckerdarosa/fargate-application-version"
}

output "fargate_alb_dns_name" {
  value = "${module.cluster-fargate.fargate_alb_dns_name}"
}