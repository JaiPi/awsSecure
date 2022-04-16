terraform {
  backend "s3" {
    profile              = "terraform-user"
    bucket               = "terraform-state-dr65g"
    workspace_key_prefix = "terraform"
    key                  = "terraform.tfstate"
    region               = "eu-west-1"
  }
}