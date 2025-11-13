# Azure Multi-Env Terraform

This repository bootstraps 5 environments: dev, qa, uat, preprod, prod.

## Structure
- `modules/` - reusable modules (network, keyvault, aks, sql, monitoring)
- `envs/<env>/` - environment-level orchestration and tfvars

## Quickstart
1. Clone repo
2. Create a storage account + container for backend state
3. Populate `envs/<env>/backend.tf` and `envs/<env>/terraform.tfvars`
4. `cd envs/dev`
5. `terraform init`
6. `terraform plan -var-file=terraform.tfvars`
7. `terraform apply -var-file=terraform.tfvars`

## Notes
- Use a dedicated service principal for Terraform with contributor-level rights on environment RGs.
- Protect Prod: run manual approvals in CI/CD pipelines.
- Policy definitions: apply stricter policies at management group or subscription level.
```

---

# Permissions & Roles
- Terraform SP needs: `Contributor` on environment resource groups, plus `Log Analytics Contributor` and `Monitoring Metrics Publisher` for diagnostic settings.
- For Key Vault access policies, supply the object ID of the principal which needs access (CI/CD or automation accounts).
