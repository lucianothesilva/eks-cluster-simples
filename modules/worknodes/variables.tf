locals {
  node_name = "lu-node-${var.tags["Env"]}"
}

variable "eks_subnet_ids" { }
variable "cluster_name" { }
variable "tags" { }
variable "worknodes" { }
variable "worknode_desired_size" { }
variable "worknode_max_size" { }
variable "worknode_min_size" { }