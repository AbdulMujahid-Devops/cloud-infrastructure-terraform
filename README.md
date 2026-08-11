# Cloud Infrastructure Terraform

> **About:** Production-style AWS infrastructure automation using Terraform, reusable modules, networking, IAM, storage, environment separation, and CI validation. This project demonstrates how a DevOps engineer can define repeatable cloud infrastructure as code instead of relying on manual console configuration.

## What this project demonstrates

This repository models a real-world Infrastructure as Code workflow. Terraform is used to describe cloud resources in a predictable, reviewable, and repeatable way. The design separates reusable modules from environment-specific configuration so the same engineering patterns can be promoted from development toward production.

### Key capabilities
- Reusable Terraform modules
- AWS networking and storage patterns
- Environment-specific configuration
- Terraform formatting and validation in CI
- IAM least-privilege principles
- Consistent resource tagging
- Safe handling of credentials and state
- Infrastructure changes reviewed through Git

## Architecture

```text
Developer → GitHub Actions → Terraform Plan → Approval → AWS
                                      │
                    ┌─────────────────┼─────────────────┐
                    │                 │                 │
                 Network           Compute           Storage
                    │                 │                 │
                   VPC             EC2/ASG             S3
```

## Structure

```text
.
├── environments/dev
├── modules/network
├── modules/compute
├── modules/storage
├── .github/workflows/terraform.yml
├── versions.tf
├── providers.tf
└── README.md
```

## Engineering practices

- Terraform 1.x with AWS provider pinning
- Reusable modules and environment-specific variables
- `terraform fmt`, `validate`, and plan in CI
- No credentials committed to Git
- State should use an encrypted S3 backend with locking in a real AWS account
- Least-privilege IAM and tagging standards

## Usage

```bash
terraform -chdir=environments/dev init
terraform -chdir=environments/dev fmt -check
terraform -chdir=environments/dev validate
terraform -chdir=environments/dev plan
terraform -chdir=environments/dev apply
```

> This repository intentionally contains safe, minimal infrastructure examples. Add account-specific IDs, secrets, and production sizing through variables or a secrets manager.
