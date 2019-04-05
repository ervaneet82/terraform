provider "aws" {}

module "my_vpc" {
  source = "modules/vpc"

  vpc_cidr_block = "${var.vpc_cidr_block}"

  public_subnet1_cidr = "${var.public_subnet1_cidr}"

  public_subnet1_availability_zone = "${var.public_subnet1_availability_zone}"

  private_subnet_1_cidr = "${var.private_subnet_1_cidr}"

  private_subnet_1_availability_zone = "${var.private_subnet_1_availability_zone}"

  private_subnet_2_cidr = "${var.private_subnet_2_cidr}"

  private_subnet_2_availability_zone = "${var.private_subnet_2_availability_zone}"
}

module "my_sgs" {
  source = "modules/sgs"
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "rds" {
  source                    = "modules/rds_auora"
  db_instance_class         = "${var.db_instance_class}"
  master_username           = "${var.master_username}"
  master_password           = "${var.master_password}"
  database_name             = "${var.database_name}"
  instance_count_in_cluster = "${var.instance_count_in_cluster}"
  environment_name          = "${var.environment_name}"
  manager                   = "${var.manager}"
  rds_subnet_id             = ["${module.my_vpc.vpc_private_1_subnet_id}", "${module.my_vpc.vpc_private_2_subnet_id}"]
  cluster_identifier        = "${var.cluster_identifier}"
  vpc_id                    = "${module.my_vpc.vpc_id}"
}

module "s3" {
  source = "modules/s3"
  bucket = "${var.bucket}"
}

# module "ec2_s3_role" {
#   source = "modules/iam"
#   bucket = "${module.s3.bucket_arn}"
# }
#
module "ec2_instances" {
  source                      = "modules/ec2"
  public_subnet               = "${module.my_vpc.vpc_public_1_subnet_id}"
  ami                         = "${var.ami}"
  instance_count              = "${var.instance_count}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = "true"
  vpc_id                      = "${module.my_vpc.vpc_id}"
}

#
# module "elb" {
#   source          = "modules/elb"
#   vpc_id          = "${module.my_vpc.vpc_id}"
#   instance_ids    = "${module.ec2_instances.instance_ids}"
#   security_groups = ["${module.my_sgs.sg_id}"]
# }


# module "route53" {
#   source  = "modules/route53"
#   zone_id = "${var.zone_id}"
#   name    = "${var.dns_name}"
#   records = "${module.ec2_instances.public_ip}"
# }

