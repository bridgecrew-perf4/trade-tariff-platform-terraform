# trade-tariff-platform

The platform related code and tools that support the UK Trade Tariff service

This repository contains multiple terraform projects. 

They operate slightly differently depending on whether their resources are global or specific to a region.

We currently have the following projects:

- `cdn` - This project is the same terraform code that creates cdn resources using different var files per environment
- `common` - This project contains resources that are shared by all environments

We also define shared modules under `terraform/modules` which are referenced by the different projects.

- [ ] TODO: Move to configuring environments with terragrunt

### CDN Example

```bash
# Change into the project root
cd terraform/cdn

# Remove lingering state files
rm -rf .terraform

# Specify the environment we need to change
export TARIFF_ENVIRONMENT=development

# Initialise environment backend
terraform init -backend-config=backends/$TARIFF_ENVIRONMENT.backend

# Run a plan using the correct environment variables file
terraform plan -var-file=vars/$TARIFF_ENVIRONMENT.tfvars

# Run an apply using the correct environment variables file
terraform apply -var-file=vars/$TARIFF_ENVIRONMENT.tfvars
```

### Common Example

```bash
cd terraform/common # Change into the project root
terraform init      # Initialise backend
terraform plan      # Run a plan
terraform apply     # Run an apply
```
