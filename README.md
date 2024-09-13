 Best Practices Considerations:

    IAM Roles and Policies: Proper IAM roles and policies are set for both the EKS control plane and worker nodes, restricting permissions only to what is required.
    Subnets: The subnets are created across multiple availability zones (AZs) to ensure high availability.
    Security Groups: Security groups restrict traffic to the necessary ports, especially securing the control plane communication.
    Autoscaling: Use autoscaling for the worker node group to scale resources automatically based on the demand.
    Separate Environments: Use workspaces or separate configurations for dev, staging, and production environments.

Stage1: Create S3 bucket and DB for remore-state maintain
Stage2: add below secrets 
Need to add some GitHub repository secrets. These are required for Terraform and AWS authentication:

    AWS_ACCESS_KEY_ID: Your AWS access key ID.
    AWS_SECRET_ACCESS_KEY: Your AWS secret access key.
    TF_BACKEND_BUCKET: The name of your S3 bucket for Terraform state.
    TF_BACKEND_KEY: The file name (key) for the Terraform state file (e.g., eks/terraform.tfstate).
    TF_BACKEND_REGION: The AWS region for your S3 bucket.
	