provider "aws" {
  version = "~> 2.0"
  region  = "${var.region}"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_subnet_ids" "default" {
  vpc_id = "${aws_default_vpc.default.id}"

  tags = {
    Tier = "Private"
  }
}

resource "aws_key_pair" "cluster_key" {
  key_name = "ecs-cluster"
  public_key = "${file(var.public_key_file)}"
}

module "ecs_cluster" {
  source = "github.com/kpenfound/ecs-cluster"

  region = "${var.region}"
  ecs_ami = "${var.ecs_ami}"
  ecs_instance_key = "${aws_key_pair.cluster_key.key_name}"
  cluster_name = "ecs_cluster_example"
  vpc_id = "${aws_default_vpc.default.id}"
  subnets = "${data.aws_subnet_ids.default.ids}"
}
