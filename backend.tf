# This backend is to store the state of terraform. This is important to keep terraform state in a centralize state
terraform {
  backend "s3" {
    bucket = "isreal-kops-state"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}