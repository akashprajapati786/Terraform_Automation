🚀 Terraform AWS EC2 Automation

This project uses Terraform to automatically provision an AWS EC2 instance along with required networking components such as VPC, Security Group, and Key Pair.

📌 Features

Creates (or uses) Default VPC

Generates an AWS Key Pair using your existing public key

Creates a Security Group allowing:

SSH (22)

HTTP (80)

Launches an EC2 instance (Amazon Linux 2023 AMI)

Sets custom root volume configuration (gp3 – 15GB)

🗂 Project Structure
.
├── main.tf               # Contains all AWS Terraform resources
├── terraform-ec2-key.pub # Your public key for EC2 access
├── README.md             # Documentation

🔧 Prerequisites

Make sure you have:

Terraform installed

AWS CLI configured with proper IAM permissions

A valid public key file (terraform-ec2-key.pub)

Run:

aws configure


and provide your AWS Access Key, Secret Key, region, etc.

🚀 How to Deploy
1️⃣ Initialize Terraform
terraform init

2️⃣ Validate the configuration
terraform validate

3️⃣ Preview the resources
terraform plan

4️⃣ Apply the infrastructure
terraform apply -auto-approve

🛑 Destroy the Infrastructure

To delete all AWS resources created by Terraform:

terraform destroy -auto-approve

🔐 Security Notes

Never commit private keys to GitHub

Always add sensitive files to .gitignore:

*.pem
*.key
.terraform/
terraform.tfstate
terraform.tfstate.backup

📬 Contact / Contribution

Feel free to open issues or contribute via pull requests.
