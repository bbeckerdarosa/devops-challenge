variable "region" {
  description = "Region to deploy the Cluster ECS Fargate in your AWS account"
  type        = string
}

variable "aws_access_key" {
  description = "Please, insert your AWS access key from your account"
  type        = string
}

variable "aws_secret_key" {
  description = "Please, insert your AWS secret key from your account"
  type        = string
}

variable "cluster_name" {
  type        = string
}

variable "capacity_providers" {
  type        = string
}

variable "env" {
  type        = string
}

variable "container_name" {
  type        = string
}

variable "container_port" {
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

variable "launch_type" {
  type        = string
}

variable "network_mode" {
  type        = string
}