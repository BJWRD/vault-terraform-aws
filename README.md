# vault-terraform-aws
[Hashicorp Vault](https://developer.hashicorp.com/vault) application, provisioned by [Terraform](https://www.terraform.io/) and hosted within a [Docker](https://www.docker.com/) container on [AWS](https://aws.amazon.com/) Public Cloud.


# Architecture
This network architecture has three subnet tiers split across three availability zones. The subnets will also have a VPC routing table that will provide it access to the internet. The Security Group will allow port 22 access to those that have the relevant .pem file, this will allow the EC2 host to be accessed and then configured using the specified commands further down this README.


![image](https://user-images.githubusercontent.com/83971386/198644799-1e3e2a34-8409-4678-8934-679e5172b68c.png)

# Prerequisites
* An AWS Account with an IAM user capable of creating resources – `AdminstratorAccess`
* A locally configured AWS profile for the above IAM user
* Terraform installation - [steps](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* AWS EC2 key pair - [steps](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

# How to Apply/Destroy
This section details the deployment and teardown of the architecture. **Warning: this will create AWS resources that costs money**

### Terraform Deployment steps

#### 1.	Clone the vault-terraform-aws repo
        
    git clone https://github.com/BJWRD/vault-terraform-aws

#### 2.	Initialise the working directory, which contains the tf configuration 

    terraform init

#### 3.	 Ensure the terraform code is formatted and validated 

    terraform fmt
    terraform validate

#### 4.	Create an execution plan
    
    terraform plan

#### 5.	Execute terraform configuration 

    terraform apply --auto-approve

### Vault - Docker Container Deployment Steps

#### 1.  On the newly provisioned AWS Host - Clone the repo

    git clone https://github.com/BJWRD/vault-terraform-aws

#### 2.  Running Vault Container
Before we begin the Vault Installation, we need to ensure that Docker and Docker-Compose has been installed on the VM you are using. Please follow the steps within the 'Prerequisites' section to get started.

Or enter the commands below to execute the *install.sh* script which includes the Docker and Docker-Compose installation commands -

    sudo chown ec2-user:ec2-user install.sh
    sudo chmod +x install.sh
    sudo ./install.sh

Once Docker and Docker-Compose has been installed, enter the following Docker-Compose command to start the Vault container in detatched mode.

    docker-compose up -d
    docker ps
    
ENTER RUNNING CONTAINER IMAGE HERE
    
### Vault Setup

TO BE UPDATED

### Testing

TO BE UPDATED

### Teardown steps

#### 1.  Stop the Docker Container which is running Vault

    docker-compose down

#### 2.	Destroy the deployed AWS Infrastructure

    terraform destroy --auto-approve


# Requirements
| Name          | Version       |
| ------------- |:-------------:|
| terraform     | ~>1.3.0     |
| aws           | ~>4.30.0      |

# Providers
| Name          | Version       |
| ------------- |:-------------:|
| aws           | ~>4.30.0      |


# List of tools/services used
* [Terraform](https://www.terraform.io/)
* [AWS](https://aws.amazon.com/)
* [Docker](https://www.docker.com/)
* [Dockerfile](https://docs.docker.com/engine/reference/builder/)
* [Docker-Compose](https://docs.docker.com/compose/install/)
* [Hashicorp Vault](https://developer.hashicorp.com/vault)
