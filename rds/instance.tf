resource "aws_db_instance" "main" {
  instance_class    = "db.t3.micro"
  storage_encrypted = true
  identifier               = "digital-ichiba-db"
  allocated_storage        = 20
  engine                   = "postgres"
  engine_version           = "18.1"
  db_subnet_group_name     = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids   = [var.db_security_group_id]

  apply_immediately       = false
  copy_tags_to_snapshot   = true
  deletion_protection     = true
  max_allocated_storage   = 1000
  skip_final_snapshot     = false
  final_snapshot_identifier = "digital-ichiba-db-final-snapshot"

  tags = {
    devops-guru-default = "digital-ichiba-db"
  }

  lifecycle {
    # 既存環境の設定値（IAM Roleなど）をここで決め打ちできないため、差分のみ抑止する
    ignore_changes = [
      monitoring_interval,
      monitoring_role_arn,
      performance_insights_enabled,
      performance_insights_kms_key_id,
      performance_insights_retention_period,
      tags_all,
    ]
  }
}