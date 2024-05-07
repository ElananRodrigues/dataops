variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "name_prefix" {
  default = "stg-ecs-staging"
}

variable "key_name" {
  default = "stg-cluster"
}