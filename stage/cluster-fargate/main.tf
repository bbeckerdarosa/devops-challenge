provider "aws" {
  region = "us-east-1"
}

module "cluster-fargate" {
  source                = "../../modules/cluster-fargate/"

  env                   = "stage"
  region                = "us-east-1"
  cluster_name          = "fargate"
  capacity_providers    = "FARGATE"
  launch_type           = "FARGATE"
  container_name        = "fargate-application-version"
  container_port        = 3000
  network_mode          = "awsvpc"
}