# Terraform Infrastructure for Django TodoApp

This project demonstrates how to deploy a Django web application to Azure Cloud using Terraform Infrastructure as Code (IaC). The main focus is on showing the complete Azure infrastructure provisioning process for a multi-tier web application with proper DevOps practices.

## Project Purpose

This repository serves as a **demonstration of Azure infrastructure deployment** using:
- Terraform for infrastructure provisioning
- Azure Resource Manager (ARM) for cloud resources
- Modular infrastructure design
- Production-ready Azure configurations
- Cloud-native deployment best practices
- Azure services integration (Compute, Network, Storage)

## Application Overview

A Django todo list application that includes:
- User authentication system
- Todo list management with CRUD operations
- REST API with Django REST Framework
- Automated deployment and service configuration

## Technologies Used

- **Terraform 1.x** - Infrastructure as Code
- **Azure Cloud Services** - Cloud platform
- **Python 3.x** - Application runtime
- **Django** - Web framework
- **Ubuntu Linux** - Virtual machine OS
- **systemd** - Service management
- **Bash** - Deployment automation
- **Git** - Source code management

## Azure Infrastructure Architecture

This project demonstrates deployment using:

### Main Infrastructure (`main.tf`)
- **Resource Group**: Container for all Azure resources
- **Virtual Network**: Network isolation and segmentation
- **Subnet**: Application tier network
- **Network Security Group**: Firewall rules and security
- **Public IP**: External access with dynamic allocation
- **Virtual Machine**: Ubuntu-based compute instance
- **Storage Account**: Backend state storage and artifacts

### Modular Design (`modules/`)
- **Compute Module**: Virtual machine and network interface
- **Network Module**: VNet, subnet, NSG, and public IP
- **Storage Module**: Storage account and containers

### Remote State Management (`backend.tf`)
- **Azure Storage Backend**: Centralized state management
- **State Locking**: Concurrent operation protection
- **Remote Collaboration**: Team-based infrastructure management

## Key Terraform Files

```
├── main.tf                                   # Main infrastructure configuration
├── variables.tf                              # Input variables definition
├── outputs.tf                                # Output values
├── backend.tf                                # Remote state configuration
├── terraform.tfvars                          # Variable values (gitignored)
├── install-app.sh                            # Application deployment script
└── modules/
    ├── compute/
    │   ├── main.tf                            # VM and network interface
    │   ├── variables.tf                       # Compute module variables
    │   └── outputs.tf                         # Compute module outputs
    ├── network/
    │   ├── main.tf                            # VNet, subnet, NSG, public IP
    │   ├── variables.tf                       # Network module variables
    │   └── outputs.tf                         # Network module outputs
    └── storage/
        ├── main.tf                            # Storage account and containers
        ├── variables.tf                       # Storage module variables
        └── outputs.tf                         # Storage module outputs
```

## How to Deploy the Infrastructure

### Prerequisites
- Azure CLI installed and configured
- Terraform >= 1.0
- Azure subscription with appropriate permissions
- SSH key pair for VM access

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/zave52/terraform-python-app.git
   cd terraform-python-app
   ```

2. **Configure Azure authentication**
   ```bash
   # Login to Azure
   az login
   
   # Set subscription (if multiple)
   az account set --subscription "your-subscription-id"
   ```

3. **Create terraform.tfvars file**
   ```bash
   # Copy example and edit values
   cat > terraform.tfvars << EOF
   ssh_key_public = "ssh-rsa AAAAB3NzaC1yc2E... your-public-key"
   storage_account_name = "yourstorageaccount$(date +%s)"
   EOF
   ```

4. **Initialize and deploy**
   ```bash
   # Initialize Terraform
   terraform init
   
   # Review planned changes
   terraform plan
   
   # Apply infrastructure
   terraform apply
   ```

5. **Access the application**
   ```bash
   # Get connection details from outputs
   terraform output application_url
   terraform output ssh_connection_command
   
   # SSH to the VM
   ssh testadmin@<public-ip>
   ```

6. **Clean up**
   ```bash
   terraform destroy
   ```

## Azure Resources Created

### 1. Resource Group
```hcl
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
```

### 2. Virtual Network and Security
```hcl
# Virtual Network with subnet
# Network Security Group with rules
# Public IP with dynamic allocation
```

### 3. Virtual Machine
```hcl
# Ubuntu 20.04 LTS VM
# SSH key authentication
# Custom data script for app installation
```

### 4. Storage Account
```hcl
# Standard LRS storage
# Private container for Terraform state
# Public container for artifacts
```

## Terraform Features Demonstrated

### 1. Module Dependencies
```hcl
module "network" {
  source = "./modules/network"
  # ... configuration
}

module "compute" {
  source = "./modules/compute"
  subnet_id = module.network.subnet_id
  # ... configuration
}
```

### 2. Remote State Backend
```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = "terraform.tfstate"
  }
}
```

### 3. Random Resource Generation
```hcl
resource "random_integer" "dns" {
  min = 10000
  max = 99999
}
```

### 4. Output Values for Integration
```hcl
output "application_url" {
  description = "The URL to access the ToDo List application"
  value       = "http://${module.network.public_ip_address}"
}
```

### 5. Variable Validation and Defaults
```hcl
variable "location" {
  description = "The Azure region where resources will be deployed"
  default     = "uksouth"
  type        = string
}
```

## Configuration

Key variables in `terraform.tfvars`:

```hcl
# Required variables
ssh_key_public = "ssh-rsa AAAAB3NzaC1yc2E..."
storage_account_name = "mystorageaccount123"

# Optional variables (have defaults)
location = "uksouth"
resource_group_name = "django-todolist"
vm_size = "Standard_B1s"
admin_username = "testadmin"
```

## Application Deployment

The `install-app.sh` script automatically:
1. Updates the Ubuntu system
2. Installs Python 3 and pip
3. Clones the Django application
4. Sets up systemd service
5. Starts the TodoApp service

## Manual Deployment (Alternative)

If you prefer step-by-step deployment:

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Create workspace (optional)**
   ```bash
   terraform workspace new production
   ```

3. **Validate configuration**
   ```bash
   terraform validate
   terraform fmt
   ```

4. **Plan deployment**
   ```bash
   terraform plan -var-file="terraform.tfvars"
   ```

5. **Apply changes**
   ```bash
   terraform apply -var-file="terraform.tfvars"
   ```

## Security Considerations

- SSH key authentication (no passwords)
- Network Security Group rules
- Private storage containers for state
- Resource group isolation
- Dynamic public IP allocation

## Cost Optimization

- Uses Standard_B1s (burstable) VM size
- Standard LRS storage (lowest cost)
- Dynamic public IP (lower cost than static)
- Proper resource tagging for cost tracking

## Troubleshooting

Common issues and solutions:

1. **Storage account name conflicts**
   - Use unique names with random suffixes
   - Check availability with `az storage account check-name`

2. **SSH connection issues**
   - Verify public key format
   - Check NSG rules allow SSH (port 22)

3. **Application not accessible**
   - Check VM status: `az vm get-instance-view`
   - Verify service status: `systemctl status todoapp`

## License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.