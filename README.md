# Cloud State With Terrafom 

Welcome to the Project Cloud State with Terraform. This project focuses on maintaining the state of your cloud infrastructure with the help of Terraform.

# Project description 

This project is designed to help you manage your cloud infrastructure with Terraform. With this project, you can easily maintain the state of your cloud infrastructure and automate the provisioning and deployment process. This project also allows you to version control your infrastructure as code, which makes it easy to track changes and deploy them to multiple environments.

The following stacks were provsisoned with Terraform:

- VPC: 6 subnets, 3 private subnets, 3 public subntes.
- Bastion Hosts: To access backend services on the private subnets
- Elastic Beanstalk
- RabbitMQ
- ElastiCache
- Load balancer 
- key Pairs
- Security Groups
- Nat gateway


# The problem

Setting up an entire infrastructure is a complex process, and doing it manually multiple times is not repeatable. This becomes even more challenging when there is heavy usage of cloud services, and regular provisioning requests and deployments. It can be difficult to track who made changes and when, and there is a high chance of making human errors. If the infrastructure state is not centralized, this can lead to non-functional infrastructure, bugs, errors, or even exposed infrastructure.

# The solution 

The solution is to have centralized configuration management of the infrastructure, which is automated to reduce the chance of human error. By maintaining a centralized state of the infrastructure, we can deploy changes easily and avoid human errors. The infrastructure should be in files or code so that we can version control it. We should have infrastructure as a code, which is repeatable and reusable across different environments and projects.

# Project features

- Automated cloud infrastructure setup and management with Terraform.
- Centralized state management to track changes and maintain a history of deployments.
- Reusable code across different environments and projects.
- Easy version control of infrastructure as code.
- Repeatable infrastructure setup, reducing the chance of human error.
- Easy deployment of changes.

# Getting Started 

To get started with this project, you will need to follow these steps:

- Clone the repository to your local machine.
- Install Terraform on your local machine.
- Configure the AWS provider in the terraform.tfvars file.
- Run terraform init to initialize the project.
- Run terraform plan to preview the changes that will be made.
- Run terraform apply to apply the changes to your AWS account.

# Conclusion 

The Project Cloud State with Terraform is an excellent way to manage your cloud infrastructure and maintain a centralized state of your infrastructure. With this project, you can easily automate your infrastructure setup and management, version control your infrastructure as code, and reduce the chance of human error. So, why wait? Start using this project today and make your cloud infrastructure management more efficient and effective.

