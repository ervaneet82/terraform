resource "aws_db_subnet_group" "default" {
  name       = "glofsmash-dev-terraform"
  subnet_ids = ["${var.rds_subnet_id}"]

  tags = {
    Name = "glofsmash-dev-terraform-subnet"
  }
}

resource "aws_rds_cluster" "default" {
  cluster_identifier = "${var.cluster_identifier}"
  engine             = "aurora-mysql"
  engine_version     = "5.7.12"

  #  availability_zones      = ["${data.aws_availability_zones.available.names}"]
  database_name           = "${var.database_name}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  backup_retention_period = 1
  skip_final_snapshot     = "true"
  apply_immediately       = "true"

  #rds_subnet_id           = ["${module.my_vpc.vpc_private_1_subnet_id}", "${module.my_vpc.vpc_private_2_subnet_id}"]
  vpc_security_group_ids = ["${aws_security_group.mydb1.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.default.name}"
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = "${var.instance_count_in_cluster}"
  identifier         = "${var.cluster_identifier}-${count.index}"
  cluster_identifier = "${aws_rds_cluster.default.id}"
  instance_class     = "${var.db_instance_class}"
  engine             = "aurora-mysql"
}
