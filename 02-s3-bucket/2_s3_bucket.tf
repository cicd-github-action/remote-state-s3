#############################################

#.... s3 bucket for terraform state ---> 2

#############################################

resource "aws_s3_bucket" "tf_remote_tate" {
  bucket = "terraform-state-lab-demo-01"
  acl    = "private" # or can be "public-read"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Terraform   = "true"
    Name        = "terraform-state-lab-demo-01"
    Environment = "Dev"
  }
}
