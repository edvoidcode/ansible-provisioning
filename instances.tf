resource "aws_instance" "node-wp" {
   ami                         = var.ami-id
   instance_type               = var.instance_type
   subnet_id                   = aws_subnet.sub-pub.id
   vpc_security_group_ids      = [aws_security_group.sgrules_wp.id]
   associate_public_ip_address = true
   // user_data                   =
   // key_name                    =
   depends_on = [aws_instance.node-sql]
 
  
   
   tags = {
     Name = "lab-wp"
   }
   
}


resource "aws_instance" "node-sql" {
   ami                         = var.ami-id
   instance_type               = var.instance_type
   subnet_id                   = aws_subnet.sub-pvt.id
   vpc_security_group_ids      = [aws_security_group.sgrules_sql.id]
   associate_public_ip_address = true
   // user_data                   =
   // key_name                    =
   
   // provisioner "local-exec" {
   //    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u {var.user} -i '${self.ipv4_address},' 
   //    --private-key ${var.ssh_private_key} main.yml"}
   
   tags = {
     Name = "lab-sql"
   }
}