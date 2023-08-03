# Terraform Infrastructure for: Vehicle Configuration System

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Workspace Configuration (Terraform Cloud)](#configuration)
- [Command Used](#command-Used)
- [Modules Used](#modules-used)
- [ Authors](#authors)

## Overview

This project aims to provide a Terraform infrastructure template for deploying frontend, backend, and database applications on ***AWS***. By utilizing Infrastructure as Code (IaC) principles, you can automate the provisioning and management of your application's infrastructure on any cloud platforms such as AWS, Azure, or Google Cloud.

The infrastructure setup includes the following components:

- Frontend Application:  Built with modern frontend frameworks like ***React***.
- Backend Application: Used ***Spring Boot*** to interact with the frontend application.
- Database: ***MySQL*** as a persistent storage solution to store and retrieve data for your application.

-   Cloud Virtual Machine: ***Amazon EC2*** compute resources for hosting all three applications.

## Prerequisites

Before getting started, ensure that you have the following prerequisites in place:

- Terraform : Install Terraform by following the official documentation for your operating system.
- Cloud Provider Account: Valid AWS account credentials with appropriate IAM permissions to provision AWS resources.
- Application Code: Prepare your frontend and backend application code, ensuring it is properly configured for deployment.

## Installation

To install and set up the project, follow these steps:

1. Clone the repository: `git clone <URL>`
2. Please create a new `env.auto.tfvars` file and populate it with the following content:

```
aws_region = "<AWS Region>"
aws_access_key = "<AWS Access Key>"
aws_secret_key = "<AWS Secret Key>"
security_group_ingress_ports = ["xx", "xxxx", "xx", "xxxx"]
ec2_ami = "<EC2 AMI Number>"
ec2_instance_type = "<EC2 Instance Type>"
ec2_tag_name = "<EC2 Tag Name>"
```

3. Place this env file inside `backend, database and frontend` folders

## Usage

To use this Terraform infrastructure template, follow these steps:

1. Inside frontend, backend and database
4. Run `terraform init` to initialize the Terraform workspace.
5. Run `terraform plan` to preview the changes that Terraform will apply to your infrastructure.
6. Run `terraform apply` to provision the infrastructure defined in your Terraform files.
7. Verify that your frontend, backend, and database applications are successfully deployed.

## Workspace Configuration (Terraform Cloud)

We also utilized Terraform Cloud, to store terraform state file in synchronized  
mode. 

***NOTE:*** If do not want to use this feature than remove terraform.tf file.

## Modules Used

This project utilizes the following custom modules:

-   `aws_ec2`: Manages the provisioning and configuration of AWS EC2 instances to host frontend, backend, and database applications.
-   `aws_sg`: Configures security groups to enforce granular network traffic rules, ensuring robust security and controlled

## Command Used
```
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy
```

## Author
[Amresh Sharma](https://github.com/AMRESH-SHARMA)