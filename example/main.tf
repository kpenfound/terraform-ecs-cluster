provider "aws" {
  version = "~> 2.0"
  region  = "${var.region}"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_subnet_ids" {
  vpc_id = "${aws_default_vpc.default.id}"
  
  tags = {
    Tier = "Private"
  }
}

