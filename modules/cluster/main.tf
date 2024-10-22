resource "aws_eks_cluster" "lu-eks-cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.lu-eks-cluster-role.arn
  version  = "1.31"

  tags = var.tags

  vpc_config {
    subnet_ids = var.eks_subnet_ids
  }

# Para que o terraform não crie o cluster antes das permissões necessárias
  depends_on = [
    aws_iam_role_policy_attachment.lu-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.lu-AmazonEKSServicePolicy,
  ]
}