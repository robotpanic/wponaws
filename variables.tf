variable "aws_region" {
  description = "VPC Region"
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "PUB CIDR"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "PRIV CIDR"
  default     = "10.0.2.0/24"
}
