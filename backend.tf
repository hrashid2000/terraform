terraform {
  backend "s3" {
    bucket = "hamzaterraformbackend"
    key = "terraform/state"
  }
}