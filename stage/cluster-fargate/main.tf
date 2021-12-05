terraform {
  backend "s3" {
    bucket = "cluster-ecs-fargate"
    key    = "stage/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region     = "us-east-1"
}

module "cluster-fargate" {
  source                = "../../modules/cluster-fargate/"

  env                   = "stage"
  bucket                = "cluster-ecs-fargate"
  region                = "us-east-1"
  cluster_name          = "fargate"
  capacity_providers    = "FARGATE"
  container_name        = "fargate-application-version"
  container_port        = 3000
}