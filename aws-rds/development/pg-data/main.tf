provider "aws" {
  region = "us-east-1" # Cambia esto por la región que desees utilizar
}

resource "aws_db_subnet_group" "example" {
  name       = "example"
  subnet_ids = ["subnet-12345678", "subnet-87654321"] # IDs de tus subredes
  tags = {
    Name = "ExampleDBSubnetGroup"
  }
}

resource "aws_db_instance" "example" {
  identifier            = "example-db"
  allocated_storage     = 20
  storage_type          = "gp2"
  engine                = "postgres"
  engine_version        = "11.10" # Cambia esto a la versión de PostgreSQL que desees utilizar
  instance_class        = "db.t2.micro"
#   name                  = "example-db"
  username              = "admin"
  password              = "password123" # Cambia esto por tu contraseña segura
  db_subnet_group_name  = aws_db_subnet_group.example.name
  parameter_group_name  = "default.postgres11" # Opcional, cambia según tus necesidades
  publicly_accessible   = false
  
  tags = {
    Name = "ExampleDBInstance"
  }
}
