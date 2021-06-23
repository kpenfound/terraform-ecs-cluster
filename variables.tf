variable "region" {
  default     = "us-east-1"
  description = "The AWS region to deploy to"
}
variable "ecs_ami" {
  default     = "ami-08fa2eb77f5afe360"
  description = "The ECS AMI to use for the ECS host. Current AMIs found here: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html"
}

variable "ecs_instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type for the ECS hosts"
}
variable "ecs_instance_key" {
  description = "EC2 key pair to associate with the hosts"
}

variable "cluster_name" {
  default     = "default"
  description = "The ECS cluster name"
}

variable "cluster_min_size" {
  default     = 1
  description = "Minimum available ECS hosts configured in the auto-scaling group"
}
variable "cluster_max_size" {
  default     = 1
  description = "Maximum available ECS hosts configured in the auto-scaling group"
}

variable "vpc_id" {
  description = "The Amazon VPC ID to deploy the ECS cluster in"
}
variable "subnets" {
  description = "List of subnet ids to deploy the ECS cluster in"
}

variable "allowed_sgs" {
  description = "List of security groups to allow for ecs cluster ingress"
  default     = []
}
