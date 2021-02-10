resource "aws_security_group_rule" "outboundRule1" {
  count             = length(var.instances_name)
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1 
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = element(aws_security_group.sg1.*.id, count.index)
}

resource "aws_security_group_rule" "outboundRule2"{
  count             = length(var.instances_name)
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = element(aws_security_group.sg1.*.id, count.index)
}


