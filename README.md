# Secure 3-Tier VPC (Fintech)

This project deploys a PCI-compliant 3-tier VPC using Terraform with the following:

- VPC with public, private app, and database subnets
- NAT Gateway for secure outbound traffic
- Application Load Balancer (ALB) in public subnet
- Encrypted RDS instance in private subnet
- CloudWatch and GuardDuty for monitoring

## How to Run
```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## How to Destroy
```bash
terraform destroy -auto-approve
```
