resource "aws_instance" "node-wp" {
   ami                         = data.aws_ami.ubuntusql.id
   instance_type               = var.instance_type
   subnet_id                   = aws_subnet.sub-pub.id
   vpc_security_group_ids      = [aws_security_group.sgrules_wp.id]
   associate_public_ip_address = true
   key_name                    = "packer-app"
   
   depends_on = [aws_instance.node-sql]
   tags = {
     Name = "node-wp"
   }
   
}


resource "aws_instance" "node-sql" {
   ami                         = data.aws_ami.ubuntusql.id
   instance_type               = var.instance_type
   subnet_id                   = aws_subnet.sub-pvt.id
   vpc_security_group_ids      = [aws_security_group.sgrules_sql.id]
   key_name                    = "packer-app"
   // user_data                   =

   
   provisioner "local-exec" {
      command = { "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u {var.user} -i '${self.ipv4_address}'
      --private-key ${var.ssh_private_key} main.yml"
         }
   
   tags = {
     Name = "node-sql"
   }
}