module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.26"
  subnets         = aws_subnet.public_subnet[*].id
  vpc_id          = aws_vpc.eks_vpc.id

  node_groups = {
    eks_node_group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"

      key_name = "expleo-demo-key"

      iam_role_arn = aws_iam_role.eks_node_role.arn

      additional_security_group_ids = [aws_security_group.eks_cluster_sg.id]
    }
  }

  cluster_role_arn = aws_iam_role.eks_cluster_role.arn

  tags = {
    Environment = "production"
    Terraform   = "true"
  }
}