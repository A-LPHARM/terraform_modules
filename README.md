<<<<<<< HEAD
# sql-rds
=======
# terraform_modules
terraform modules to build a 2 tier-architecture with route 53
>>>>>>> main

THIS SIMPLE PROJECT INVOLVES DEPLOYING A 2-TIER ARCHITECTURE ON AWS USING TERRAFORM MODULES


## Architecture Components

The 2-tier architecture consists of:

1. **Web App Tier**: This tier encompasses the user interface and communication with the application.

2. **Database Tier**: This tier is responsible for storing and managing information.

## Prerequisites

Before getting started, ensure you have the following prerequisites:

- An AWS account
- AWS access key and secret access key
- Terraform version v1.6.4

## Setup Instructions

### 1. Create Root Module Folder

Begin by creating a `main.tf` file within the root module folder. This file will serve as the main configuration for the root module.

Refer to the configuration file [here](https://github.com/A-LPHARM/terraform_modules/blob/sql-terraform/henryproject/main.tf) for a comprehensive example.

### 2. Define Terraform Variables

In the project directory, create a `variables.tf` file to define variables that will be utilized throughout the project. Define variables for AWS credentials, VPC CIDR, subnet CIDRs, instance type, AMI ID, and other relevant parameters.

### 3. Create Terraform Modules

Organize the project by creating separate directories for each Terraform module: vpc, security, alb, database, ec2, and route_53.

Within each module directory, include the following files:
- `main.tf` for the main configuration
- `variables.tf` for variable definitions
- `output.tf` for output configurations

### 4. Configure Terraform Modules

Reference the child modules in the root module using the module resource. Set the required variables for each child module.

### 5. Apply Terraform Configuration

Follow these steps to apply the Terraform configuration:

Initialize Terraform:
```bash
terraform init
```

Validate your configuration:
```bash
terraform validate
```

Apply the Terraform configuration:
```bash
terraform plan
terraform apply
```

### 6. Verify Deployment

Verify the successful deployment of resources on AWS by checking the AWS Management Console.

Now, your 2-tier architecture should be up and running, with the web app tier for the user interface and communication, and the database tier for information storage and management.