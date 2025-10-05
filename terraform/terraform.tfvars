# terraform.tfvars

# EC2 key pair
key_name = "key4projects"

# RDS credentials
db_username = "admin"                   # or whatever username you want
db_password = "YourSecurePasswordHere"  # NEVER commit real passwords to public repos

# VPC / networking (if using variables)
vpc_id       = "vpc-0123456789abcdef0"
subnet_ids   = ["subnet-12345678", "subnet-87654321"]

# ALB settings
alb_name           = "fintech-alb"
alb_security_groups = ["sg-0123456789abcdef0"]

# Target group settings
tg_name   = "fintech-tg"
tg_port   = 5000
tg_proto  = "HTTP"

# Optional: CloudWatch log group
log_group_name = "/fintech/app"

# Optional: App environment
app_env = "production"

