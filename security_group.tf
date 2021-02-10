resource "aws_security_group" "sg1" {
  count                  = length(var.instances_name)
  name                   = var.instances_name[count.index]
  description            = "Allow inbound traffic as Per Resource/Requirement"
  vpc_id                 = data.aws_subnet.subnet-selected1.vpc_id
  revoke_rules_on_delete = "true"
  tags = merge(
    map(
      "Name", "sg-${var.projectName}-${lower(var.instances_name[count.index])}",
      "product", "sg-${var.projectName}-${lower(var.instances_name[count.index])}"
    )
  )

}

