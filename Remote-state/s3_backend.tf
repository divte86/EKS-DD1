provider "aws" {
  region     = "us-west-2"
  access_key = "XXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my-terraform-state-bucket"  
  acl    = "private"

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

  tags = {
    Name        = "terraform-state-bucket"
    Environment = "Non-prod"
  }
}

resource "aws_dynamodb_table" "terraform_lock_table" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key = "LockID"

  tags = {
    Name        = "terraform-state-lock-table"
    Environment = "Non-prod"
  }
}
