
variable "aws_region" {
  description = "AWS region for the observability infrastructure."
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Prefix used for AWS resource names and tags."
  type        = string
  default     = "cloud-observability"
}

variable "vpc_cidr" {
  description = "CIDR range for the new VPC."
  type        = string
  default     = "10.40.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet hosting the EC2 instance."
  type        = string
  default     = "10.40.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR range reserved for future private resources. No NAT Gateway is created."
  type        = string
  default     = "10.40.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for the observability platform."
  type        = string
  default     = "c7i-flex.large"
}

variable "root_volume_size" {
  description = "EC2 root EBS volume size in GiB."
  type        = number
  default     = 20

  validation {
    condition     = var.root_volume_size >= 8 && var.root_volume_size <= 100
    error_message = "root_volume_size must be between 8 and 100 GiB."
  }
}

variable "allowed_ssm_operator_arns" {
  description = "Optional IAM principal ARNs for documentation only; instance access is through AWS Systems Manager permissions on the caller."
  type        = list(string)
  default     = []
}

variable "deployment_package_s3_arn" {
  description = "ARN of the S3 deployment package accessible by the EC2 instance."
  type        = string
}
