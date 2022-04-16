module "vpc" {
    source = "./vpc"
}

module "instance" {
    source = "./instance"
    # PATH_TO_PRIVATE_KEY = var.PATH_TO_PRIVATE_KEY
    AWS_REGION = var.AWS_REGION
    vpc_id = module.vpc.vpc_main_id
    subnet_id = module.vpc.subnet_public-1_id
    mykeypair_name = module.keypair.mykeypair_name
}

output "public_ip" {
    value = module.instance.ip
}

module "keypair" {
    source = "./keypair"
    PATH_TO_PUBLIC_KEY = var.PATH_TO_PUBLIC_KEY
}

# module "security-group" {
#     source = "./security-group"
# }