resource "aws_db_subnet_group" "db_group" {
  name       = "fintech-db-subnet-group"
  subnet_ids = [aws_subnet.private_db.id]
}

resource "aws_db_instance" "rds" {
  identifier         = "fintech-db"
  allocated_storage  = 20
  engine             = "mysql"
  instance_class     = "db.t3.micro"
  username           = "admin"
  password           = "ChangeMe123!"
  db_subnet_group_name = aws_db_subnet_group.db_group.name
  vpc_security_group_ids = []
  multi_az           = true
  storage_encrypted  = true
  skip_final_snapshot = true
  publicly_accessible = false
}
