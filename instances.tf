
resource "aws_instance" "node-wp" {
   

   provisioner "local-exec" {
      command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u {var.user} -i '${self.ipv4_address},' 
      --private-key ${var.ssh_private_key} main.yml"}
}

