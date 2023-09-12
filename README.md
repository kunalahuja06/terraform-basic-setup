# terraform-basic-setup

This is a basic terraform setup to create a Lambda function and an API Gateway to invoke it.

## Prerequisites

- Terraform 0.12.6
- AWS CLI
- AWS Account

## Setup

1. Clone this repository
2. Update access_key and secret_key in `provider.tf` with your AWS credentials
3. Update Lambda function code in `lambda.tf` with your own code
4. Run `terraform init` to initialize the project
5. Run `terraform plan` to see what resources will be created
6. Run `terraform apply` to create the resources

## references

- [Terraform AWS Provider](https://www.terraform.io/docs/providers/aws/index.html)


