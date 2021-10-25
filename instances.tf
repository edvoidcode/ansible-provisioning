
resource "aws_instance" "node-wp" {
   ami =
   instance_type               = var.ami-id
   subnet_id                   =
   vpc_security_group_ids      =
   associate_public_ip_address =
   user_data                   =
   key_name                    =
   tags = {
     Name = "lab-wp"
   }
   // depends_on = [

   provisioner "local-exec" {
      command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u {var.user} -i '${self.ipv4_address},' 
      --private-key ${var.ssh_private_key} main.yml"}
}

