resource "aws_s3_bucket" "assets" {
  bucket = "${var.project_name}-${var.environment}-assets"
  tags   = { Name = "assets", environment = var.environment }
}

resource "aws_s3_bucket" "backups" {
  bucket = "${var.project_name}-${var.environment}-backups"
  tags   = { Name = "backups", environment = var.environment }
}