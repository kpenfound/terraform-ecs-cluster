resource "aws_autoscaling_group" "ecs" {
  name = "ecs-${var.cluster_name}-asg"
  min_size = "${var.cluster_min_size}"
  max_size = "${var.cluster_max_size}"
  vpc_zone_identifier = "${var.subnets}"
  launch_configuration = "${aws_launch_configuration.ecs_instance.name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "ecs_instance" {
  name = "ecs-instance-${var.cluster_name}"
  image_id = "${var.ecs_ami}"
  instance_type = "${var.ecs_instance_type}"
  key_name = "${var.ecs_instance_key}"
  user_data = "echo ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config"
  security_groups = ["${aws_security_group.cluster_instance.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_cluster" "cluster" {
  name = "${var.cluster_name}"
}

resource "aws_security_group" "cluster_instance" {
  name = "ecs-cluster-${var.cluster_name}"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    self = true
  }
}
