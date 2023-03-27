resource "aws_db_subnet_group" "delight-rds-subnetgroup" {
  name       = "delight-rds-subnetgroup"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]

  tags = {
    Name = "delight-rds-subnetgroup"
  }
}

resource "aws_elasticache_subnet_group" "elastic-cache-subgrp" {
  name       = "elastic-cache-subgrp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]

  tags = {
    Name = "elastic-cache-subgrp"
  }
}


resource "aws_db_instance" "delight-rds" {
  allocated_storage      = 20
  db_name                = var.dbname
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = var.dbuser
  password               = var.dbpass
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  multi_az               = "false"
  publicly_accessible    = "false"
  db_subnet_group_name   = aws_db_subnet_group.delight-rds-subnetgroup.name
  vpc_security_group_ids = [aws_security_group.delight-backend-sg.id]

}

resource "aws_elasticache_cluster" "delight-cache" {
  cluster_id           = "delight-cache"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.4"
  port                 = 11211
  security_group_ids   = [aws_security_group.delight-backend-sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.elastic-cache-subgrp.name

}

resource "aws_mq_broker" "delight-rmq" {
  broker_name        = "delight-rmq"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.9"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.delight-backend-sg.id]
  subnet_ids         = [module.vpc.private_subnets[0]]

  user {
    username = var.rmquser
    password = var.rmqpass
  }
}