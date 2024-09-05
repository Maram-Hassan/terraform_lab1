terraform {
  backend "s3" {
    bucket         = "mybackend-terraform"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamoDB-terraform"
  }
}
