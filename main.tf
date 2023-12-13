# Definição do provider

terraform {
  required_providers {
    aws = {
      region = "us-east-1"
      source = "hashicorp/aws"
      version = "5.30"
    }
  }
}

# Módulos
module "ec2_instances" {
  source = "./modules/ec2"

  # Variáveis específicas do módulo.
  count         = 3
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = module.subnet.example_subnet_id
  security_group_id = module.security_group.example_security_group_id
  iam_role_name = "prometheus_role"
}

module "ebs_volume" {
  source = "./modules/ebs"

  # Variáveis específicas do módulo.
  availability_zone = "us-east-1a"
  size              = 10
}

module "network" {
  source = "./modules/network"

  # Variáveis específicas do módulo.
  vpc_id     = "vpc-prod"
  cidr_block = "10.0.1.0/24"
}

module "security_group" {
  source = "./modules/security_group" # Diretório do módulo do grupo de segurança

  # Variáveis específicas do módulo.
  vpc_id = "vpc-prod"
}