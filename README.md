# Opswork (Accomplished in 3 Hours)

Terraform provisoning using ansible 

This asignmnet consists of terraform(Infrastructure As A Service) and ansible as (Cofigruation managment tool).


It is used for creating three bare metal EC2 ubuntu system with vpc and networking(NAT Gateway, Private Route table, Elastic Ip) using terraform on Aws cloud.

List of Aws Services being used :

1. VPC

2. Subnet
    - Public with internet gateway
    - Private subnet is behind Nat Gateway
    
3. Natgateway Configured (hosted in Public Subnet)

4. Private Route Table specific to Natgateway created and associated with Private subnet



Here, Ansible is used for installing basic packages like wget, curl, Java, Elasticsearch, Terraform etc.


In Elasticsearch all the three nodes can be master/data nodes and the initial cluster master node is created seprately.

HTTP ssl encryption using self signed certificate after enabling xpack ssl security:


Terraform null resource with local-exec is being used for running ansible-playbook for installation and configruation of Elasticsearch service on each ec2 instance.


