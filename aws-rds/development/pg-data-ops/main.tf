terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "5.17.0" }
  }

  backend "s3" {
    bucket = "hype-ecs-terraform-state"
    key    = "aws-rds/development/pg-data-ops/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.name_default
  subnet_ids = var.subnet_ids
  tags = {
    Name = "${var.name_default}-SubnetGroup"
  }
}

resource "aws_db_instance" "db_instance" {
  identifier        = var.name_default
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  username          = var.username
  password          = var.password

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  parameter_group_name = var.parameter_group_name
  publicly_accessible  = false

  tags = {
    Name = "${var.name_default}-Instance"
  }
}
