resource "aws_key_pair" "ec2key" {
  key_name = "Abhishek_RD_account_key_pair"
  public_key = "${file("${path.module}/data/ssh_host_rsa_key.pub")}"
}

resource "aws_instance" "asginments" {
  count = "${length(var.instances_name)}"
  ami =  "${var.ec2freetier}" 
  instance_type          = "t2.large"
  subnet_id = "${data.aws_subnet.subnet-selected1.id}"
  key_name ="${aws_key_pair.ec2key.key_name}"
  disable_api_termination = false
  vpc_security_group_ids=["${element(aws_security_group.sg1.*.id,count.index)}"]
  tags = "${merge(
    map(
      "Name", "${lower(var.instances_name[count.index])}",
       "product", "${lower(var.instances_name[count.index])}"
    )
  )}"
  volume_tags ="${merge(
    map(
      "Name", "${lower(var.instances_name[count.index])}",
       "product", "${lower(var.instances_name[count.index])}"
    )
  )}"
  root_block_device  {
      volume_size="${var.volumneSizeforRoot}"
      delete_on_termination=true
      encrypted=true
      kms_key_id = "${var.kmskeyidforRoot}"
  }
/*  provisioner "local-exec" {
    command = <<EOT
      sleep 30;
      >/root/terraform/ansible/inventory.yml;
	echo "[elasticsearch]" | tee -a /root/terraform/ansible/inventory.yml;
        echo "${aws_instance.asginment[count.index].private_ip}";
        ansible-playbook -i '/root/terraform/ansible/inventory.yml' /etc/ansible/roles/elasticsearch.yml --private-key /etc/ssh/ssh_host_rsa_key -u ubuntu --become-user root 
        EOT
}
*/
}
/*
output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       =  split(",", "aws_instance.asginment.*.private_ip")
}
*/
