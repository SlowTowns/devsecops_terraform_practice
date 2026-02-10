provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "devsecops_bucket" {
  bucket = "mi-bucket-inseguro-nombre-unico-123" # ¡Cambia esto!

  # Esto es una mala práctica de seguridad
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Recurso para definir el acceso (ACL)
resource "aws_s3_bucket_acl" "devsecops_bucket_acl" {
  bucket = aws_s3_bucket.devsecops_bucket.id
  acl    = "public-read" # <--- ¡Aquí está el problema grave!
}