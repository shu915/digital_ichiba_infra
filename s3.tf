resource "aws_s3_bucket" "app" {
  bucket = "aws-training-shu"

  tags = {
    Name    = "aws-training-shu"
    Service = "digital-ichiba"
  }
}