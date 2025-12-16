resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "digital-ichiba-rds-subnet-group"
  description = "digital-ichiba-rds-subnet-group"
  subnet_ids = [var.private_subnet_1a_id, var.private_subnet_1c_id]
}