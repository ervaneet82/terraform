provider "aws" {}

module "my_aws" {
  source             = "../modules/ec2"
  PATH_TO_PUBLIC_KEY = "../modules/ec2/mykey.pub"
  num_nodes          = 1
}



#module "my_s3" {
#  source = "../modules/s3"
#}

