## Primer ejemplo de terraform con AWS

Se crean las siguientes caracteristicas

- Configuración inicial archivo main.tf
  - Definición del provider
  - Deficición de las versiones y carcteristicas de privider (region usada en AWS)

```json
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}
```

- Configuración de un backend
  - Configuracion de respaldo del estado del proyecto en bucket s3

```json
terraform {
  backend "s3" {
    bucket         = "tfstate-tar-testing-jls"
    #dynamodb_table = "state-lock-tfstate-tar"
    key            = "environments/testing/aws-s3-bucket.tfstate"
    region         = "us-east-1"
  }
}
```

- Creación de recurso Instance ec2

```json
resource "aws_instance" "app_server" {
  ami           = "ami-01ce47da86486d7b5"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
```

- Uso de variables de entrada

```json
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "TestInstance"
}
```

- Uso de variables de salida

```json
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
```
