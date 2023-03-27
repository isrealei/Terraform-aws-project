resource "aws_security_group" "delight-bean-elb-sg" {
  name        = "delight-bean-elb-sg"
  description = "Security group for elastic beanstalk loadbalance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow port 80 from all IPs"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

}

resource "aws_security_group" "bastion-host-sg" {
  name        = "bastion-host-sg"
  description = "Security group for the jump-server/bastion host"
  vpc_id      = module.vpc.vpc_id

  ingress {
    cidr_blocks = [var.MYIP]
    description = "Allow port 22 from all IPs"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

resource "aws_security_group" "delight-prod-sg" {
  name        = "delight-prod.sg"
  description = "Security tgroup for beanstalk ec2 instances"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "TLS from VPC"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion-host-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "delight-prod-sg"
  }
}

resource "aws_security_group" "delight-backend-sg" {
  name        = "delight-backend.sg"
  description = "Security group for backend services e.g RDS, RabbitMQ e.t.c"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "TLS from VPC"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.delight-prod-sg.id]
  }

  ingress {
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = [aws_security_group.bastion-host-sg.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "delight-backend-sg"
  }
}

resource "aws_security_group_rule" "allow_traffic_fromwithin" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.delight-backend-sg.id
  source_security_group_id = aws_security_group.delight-backend-sg.id
}