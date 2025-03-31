output "app_public_ips" {
  value       = module.app.ec2_instances_public_ips
  description = "Public IPs of the environment EC2 instances"
}
