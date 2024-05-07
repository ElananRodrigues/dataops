variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "name_prefix" {
  default = "cluster-ecs-tutorial-production"
}

variable "key_name" {
  default = "stg-cluster"
}