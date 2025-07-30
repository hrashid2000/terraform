terraform {
  backend "s3" {
    bucket = "hamzaterraformbackend"
    prefix = "terraform/state"
  }
}