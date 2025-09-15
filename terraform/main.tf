provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    ec2 = "http://ip10-0-33-4-d33s8ipntdlhbpdsdc60-4566.direct.lab-boris.fr"
  }
}

variable "instance_count" {
  type = number
}

resource "aws_instance" "demo" {
  ami           = "ami-12345678"  # fictif pour LocalStack
  count         = var.instance_count
  instance_type = "t2.micro"
  tags = {
    Name = "LocalStackDemo-${count.index + 1}"
  }
}
