resource "aws_db_instance" "main" {
  instance_class    = "db.t3.micro"
  storage_encrypted = true

  # 既存DBインスタンス（state）と揃えて、不要な差分を出さない
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