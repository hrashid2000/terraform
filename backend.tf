terraform {
  backend "s3" {
    bucket = "hamzaterraformbackend"
    key = "terraform/state/terraform.tfstate"
    region = "us-east-1"
    profile = "hamza"
  }
}