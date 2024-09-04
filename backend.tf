terraform {
  backend "s3" {
    bucket         = "pihu22" # change this
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
