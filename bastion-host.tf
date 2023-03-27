resource "aws_instance" "delight-bastion-host" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.delight-key.key_name
  subnet_id              = module.vpc.public_subnets[0]
  count                  = var.instance_count
  vpc_security_group_ids = [aws_security_group.bastion-host-sg.id]


  tags = {
    Name    = "jump-server"
    PROJECT = "Delight"
  }
}