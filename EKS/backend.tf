terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"  # Replace with your actual bucket name
    key            = "eks/terraform.tfstate"      # This is the path in the S3 bucket where the state will be stored
    region         = "us-west-2"                  # Your AWS region
    dynamodb_table = "terraform-state-lock"       # The name of the DynamoDB table
    encrypt        = true                         # Enable encryption for state file
  }
}
