# Cloud Infrastructure Terraform

Production-style AWS infrastructure as code demonstrating Senior DevOps practices: reusable Terraform modules, remote state, environment separation, IAM least privilege, validation, and CI.

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
