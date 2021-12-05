variable "region" {
  description = "Region to deploy cluster in AWS"
  type        = string
}

variable "aws_access_key" {
  description = "This is the AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "This is the AWS secret key"
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

variable "cluster_name" {
  type        = string
}

variable "capacity_providers" {
  type        = string
}

variable "container_name" {
  type        = string
}

variable "container_port" {
  type        = string
}

variable "container_port" {
  type        = string
}

variable "subnets"       { 
  type        = list(string) 
}

variable "vpc_id" {
  type        = string
}