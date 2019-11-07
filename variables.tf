variable region {
  default = "us-east-1"
}
variable ecs_ami {
  default = "ami-08fa2eb77f5afe360"
}

variable cluster_name {
  default = "default"
}

variable cluster_min_size {
  default = 0
}
variable cluster_max_size {
  default = 1
}

variable vpc_id {}
variable subnets {}
