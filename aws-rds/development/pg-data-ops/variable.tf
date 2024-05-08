
variable "region" {
  description = "The AWS region to launch the instance."
  default     = "us-east-1"
}

variable "name_default" {
  description = "The name of the RDS instance."
  default     = "pg-data-ops"
}

variable "subnet_ids" {
  description = "The subnet IDs for the RDS instance."
  type        = list(string)
  default     = ["subnet-0663da4f", "subnet-827fb1af"]
}

variable "allocated_storage" {
  description = "The amount of storage to allocate."
  default     = 20
}

variable "storage_type" {
  description = "The type of storage to use."
  default     = "gp2"
}

variable "engine" {
  description = "The database engine to use."
  default     = "postgres"
}

variable "engine_version" {
  description = "The version of PostgreSQL to use."
  default     = "11.10"
}

variable "instance_class" {
  description = "The instance class to use."
  default     = "db.t2.micro"
}

variable "username" {
  description = "The username to use for the database."
  default     = "admin"
}

variable "password" {
  description = "The password to use for the database."
  default     = "password123"
}

variable "parameter_group_name" {
  description = "The name of the parameter group to use."
  default     = "default.postgres11"
}