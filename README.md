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

Stage3:
Triggers:

    The pipeline is triggered when a pull request is opened or updated with changes to the Terraform files.
    On pushes to the main branch, it will run terraform apply to make changes in the production environment.

AWS Credentials:

    The pipeline uses the aws-actions/configure-aws-credentials@v2 action to configure AWS access keys from the GitHub secrets.

Terraform Setup:

    The pipeline uses hashicorp/setup-terraform@v2 to install the specified Terraform version.

Terraform Commands:

    terraform init initializes Terraform and configures the backend (S3 for state storage).
    terraform plan generates a plan and saves it to tfplan.
    terraform apply is run only on the main branch to avoid accidental changes in other branches.