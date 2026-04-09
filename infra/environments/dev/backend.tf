terraform {
  backend "s3" {
    bucket         = "hc-nodejs-ecs-tfstate-2026"
    key            = "nodejs/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "hc-nodejs-terraform-locks"
    encrypt        = true
  }
}