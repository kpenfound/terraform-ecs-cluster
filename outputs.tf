output "ecs_asg" {
  value = aws_autoscaling_group.ecs
  description = "The AWS Autoscaling group associated with the ECS cluster"
}
