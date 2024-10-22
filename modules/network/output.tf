output "vpc_id" {
  value = aws_vpc.lu_private_vpc.id
}

output "eks_subnet_ids" {
  value = aws_subnet.lu-eks-subnet.*.id
}

output "cluster_name" {
  value = local.cluster_name
}