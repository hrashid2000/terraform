provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  =  "hamza"
  region                   = var.region
}
