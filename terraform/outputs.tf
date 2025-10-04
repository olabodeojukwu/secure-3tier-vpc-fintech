output "alb_dns" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "app_public_ips" {
  description = "Public IPs of all EC2 instances"
  value       = aws_instance.app[*].public_ip
}

output "ec2_public_ip" {
  description = "Public IP of the first EC2 instance (used by GitHub Actions workflow)"
  value       = aws_instance.app[0].public_ip
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.fintech_db.endpoint
}

