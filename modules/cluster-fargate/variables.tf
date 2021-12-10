variable "region" {
  description = "Region to deploy the Cluster ECS Fargate in your AWS account"
  type        = string
}

variable "cluster_name" {
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

variable "launch_type" {
  type        = string
}

variable "network_mode" {
  type        = string
}

variable "cpu" {
  type        = string
}

variable "memory" {
  type        = string
}

variable "desired_count" {
  type        = string
}

variable "container_image" {
  type        = string
}