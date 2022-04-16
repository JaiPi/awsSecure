# variable "PATH_TO_PRIVATE_KEY" {
# }

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-0f29c8402f8cce65c"
  }
}

variable "AWS_REGION" {
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "vpc_id" {}

variable "subnet_id" {}

variable "mykeypair_name" {}
