/*resource "null_resource" "setup_ansible_inventory"{
  count = "${length(var.instances_name)}"
  provisioner "local-exec" {
  command = "terraform output -json private_ip | jq -r '.[0:-1]' > ansible/inventory.yml"
}
}
*/



resource "null_resource" "setup_elastic_service" {
  count = "${length(var.instances_name)}"
  provisioner "local-exec" {
  command = "sleep 200; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${aws_instance.asginments[count.index].private_ip},' /etc/ansible/roles/elasticsearch.yml --private-key /etc/ssh/ssh_host_rsa_key -u ubuntu --become-user root"


#  command = <<EOT
#      sleep 30;
#      >/root/terraform/ansible/inventory.yml;
#        echo "[elasticsearch]" | tee -a /root/terraform/ansible/inventory.yml;
#        echo "${aws_instance.asginments[count.index].private_ip}" >> /root/terraform/ansible/inventory.yml;
#        ansible-playbook -i '/root/terraform/ansible/inventory.yml' /etc/ansible/roles/elasticsearch.yml --private-key /etc/ssh/ssh_host_rsa_key -u ubuntu --become-user root
   
#   EOT
}
}

#terraform output -json private_ip | jq -r '.[2]'
