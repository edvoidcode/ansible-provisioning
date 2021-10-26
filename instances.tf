
resource "aws_instance" "node-wp" {
   ami =
   instance_type               = var.ami-id
   subnet_id                   = aws_subnet.sub-pub.id
   vpc_security_group_ids      = [aws_security_group.sg-rules-wp.id]
   associate_public_ip_address = true
   user_data                   =
   key_name                    =
   // depends_on = [ 
   
   provisioner "local-exec" {
      command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u {var.user} -i '${self.ipv4_address},' 
      --private-key ${var.ssh_private_key} main.yml"}
   tags = {
     Name = "lab-wp"
   }
   
}


resource "aws_instance" "node-wp" {
   ami =
   instance_type               = var.ami-id
   subnet_id                   = aws_subnet.sub-pvt.id
   vpc_security_group_ids      = [aws_security_group.sg-rules-wp.id]
   associate_public_ip_address = true
   user_data                   =
   key_name                    =
   // depends_on = [ 
   
   provisioner "local-exec" {
      command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u {var.user} -i '${self.ipv4_address},' 
      --private-key ${var.ssh_private_key} main.yml"}
   tags = {
     Name = "lab-wp"
   }
   
}