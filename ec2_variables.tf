#instance_names

variable "instances_name" {
  description = "Instance name for elasticsearch cluster"
  default = ["node1", "node2", "node3"]
}

variable "kmskeyidforRoot" {
    default=""

}

variable "volumneSizeforRoot" {
    default="10"

}

variable "volumneSize" {
  default=""
}


variable "kmskeyid" {
    default=""

}

variable "deleteonTermination" {
  type        = "string"
  default     = true
  description = "Whether the data volume should be destroyed on instance termination"
}

variable "instanceType" {
  default= ["t2.micro"]
}

variable "ec2freetier" {
   default= "ami-0a741b782c2c8632d"
}
