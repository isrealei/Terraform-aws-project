resource "aws_instance" "delight-bastion-host" {
  ami                    = lookup(var.AMIS, var.REGION)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.delight-key.key_name
  subnet_id              = module.vpc.public_subnets[0]
  count                  = var.instance_count
  vpc_security_group_ids = [aws_security_group.bastion-host-sg.id]


  tags = {
    Name    = "jump-server"
    PROJECT = "Delight"
  }

  provisioner "file" {
    content     = templatefile("templates/db-deploy.tmpl", { rds-endpoint = aws_db_instance.delight-rds.address, dbuser = var.dbuser, dbpass = var.dbpass })
    destination = "/tmp/delight-dbdeploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/delight-dbdeploy.sh",
      "sudo /tmp/delight-dbdeploy.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.public_ip
  }

  depends_on = [aws_db_instance.delight-rds]

}