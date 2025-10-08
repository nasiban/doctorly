variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI ID"
  default     = "ami-0fc5d935ebf8bc3bc" 
}

variable "key_name" {
  description = "Name of your AWS key pair"
}

variable "public_key_path" {
  description = "Path to your public SSH key"
}
