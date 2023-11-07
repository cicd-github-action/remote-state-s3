provider "aws" {
  region = "us-east-2"
}

#############################################

#.... DynamoDB for locking the state file --> 1 

#############################################

resource "aws_dynamodb_table" "tf_state_locking" {
  name         = "dynamodb-state-locking"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Terraform   = "true"
    Name        = "dynamodb-state-locking"
    environment = "Dev"
  }
}


