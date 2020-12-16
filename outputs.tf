output "ecs_asg" {
  value       = aws_autoscaling_group.ecs
  description = "The AWS Autoscaling group associated with the ECS cluster"
}

output "sg_id" {
  value       = aws_security_group.cluster_instance.id
  description = "The id of the clusters security group"
}
