---

# 🌐 **Azure Multi-Environment Infrastructure with Terraform & Azure DevOps**

This repository contains a fully modular, production-ready **Infrastructure as Code (IaC)** setup for deploying Azure resources across **Dev, QA, UAT, Preprod, and Prod** environments using **Terraform**.
Deployments can be executed:

* **Locally** (init → validate → plan → apply)
* **Automatically through Azure DevOps Pipelines**

The architecture is designed to support enterprise-scale deployments with security, modularity, consistency, and automation.

---

##  **Features**

###  Multi-environment isolation

Each environment (dev/qa/uat/preprod/prod) has its own:

* Resource Group
* Virtual Network & Subnets
* AKS Cluster (optional per environment)
* SQL Server + Database
* Key Vault
* Private Endpoints
* Log Analytics Workspace
* Diagnostic Settings
* Custom Tags

---

###  Modular Terraform Architecture

All core components are defined as **reusable modules**:

```
modules/
  ├── aks/
  ├── keyvault/
  ├── sql/
  ├── network/
  └── monitoring/
```

Each environment simply calls these modules with different variables.

---

###  Remote Backend (Azure Storage)

Terraform state is stored securely in an Azure Storage Account using:

* Storage Account
* State Container (`tfstate`)
* Per-environment state keys

This ensures **team collaboration**, **locking**, and **state consistency**.

---

###  Azure DevOps Multi-Stage Pipeline

The repo includes a YAML-based Azure DevOps pipeline supporting:

* Terraform install
* Azure CLI authentication
* Terraform Init → Validate → Plan → Apply
* Environment-level deployments
* Controlled promotion across stages (commented out for safety)

This allows both **manual** and **CD** workflows.

---

###  Monitoring & Diagnostics

Log Analytics integration is configured for:

* AKS cluster logs and metrics
* SQL Server diagnostics
* Workspace retention policies

---

###  Cost Management

Deployment is validated in **Dev** environment only (apply + destroy),
helping reduce cloud billing while ensuring code quality.

---

## 📂 **Repository Structure**

```
azure-multi-env-terraform/
├── modules/
│   ├── aks/
│   ├── keyvault/
│   ├── sql/
│   ├── monitoring/
│   └── network/
└── env/
    ├── dev/
    ├── qa/
    ├── uat/
    ├── preprod/
    └── prod/
```

Each environment contains:

* backend.tf
* main.tf
* variables.tf
* terraform.tfvars
* outputs.tf

---

## ⚙️ **Prerequisites**

### ✔ Tools

* Terraform ≥ 1.4+
* Azure CLI ≥ 2.50+
* Azure DevOps account

### ✔ Azure Setup

Before the first deployment:

1. Create Terraform backend:

   ```bash
   az group create -n rg-tfstate -l eastus
   az storage account create -n <uniqueName> -g rg-tfstate -l eastus --sku Standard_LRS
   az storage container create --name tfstate --account-name <uniqueName>
   ```

2. Create a **Service Principal**:

   ```bash
   az ad sp create-for-rbac --name terraform-sp --role Contributor \
       --scopes /subscriptions/<subscriptionId>
   ```

3. Add these values to **Azure DevOps Variable Group**:

   * ARM_CLIENT_ID
   * ARM_CLIENT_SECRET
   * ARM_TENANT_ID
   * ARM_SUBSCRIPTION_ID

---

## 🧪 **Local Deployment (Manual)**

From any environment folder:

### 1. Initialize

```bash
terraform init
```

### 2. Validate

```bash
terraform validate
```

### 3. Plan

```bash
terraform plan -out=tfplan
```

### 4. Apply

```bash
terraform apply tfplan
```

### 5. Destroy (optional)

```bash
terraform destroy
```

---

## 🔄 **Azure DevOps Deployment (Pipeline)**

Pipeline performs:

1. Azure CLI login using service connection
2. Export SP credentials for Terraform backend
3. Terraform init
4. Terraform validate
5. Terraform plan
6. (Optional) Terraform apply

Only **Dev** is enabled; other environments are commented out for safety.

---

## 🛡 Security Considerations

* Key Vault stores secrets securely
* No hard-coded credentials
* ARM credentials injected using DevOps variable groups
* Least privilege access for Terraform SP
* Diagnostic logging enabled for all critical components
* Private endpoints used for SQL

---

## 📈 Scalability & Extendability

This setup supports:

* Adding new environments
* Adding new modules (Redis, Storage, API Management, etc.)
* Enabling GitOps for AKS
* Integrating policies & governance
* Adding cost alerts & budget automation

---

## 🧹 Cleanup

To avoid billing:

```bash
terraform destroy
```

or delete the RG:

```bash
az group delete -n rg-demoapp-dev --yes --no-wait
```

---

## ✨ Summary

This project provides a **complete enterprise IaC framework** for Azure, using Terraform & Azure DevOps to deliver consistent, secure, multi-environment cloud deployments.

It includes:

* Modular Terraform design
* Multi-environment setup
* Backend configuration
* CI/CD automation
* Monitoring and governance
* Cost-efficient workflow

---

#Terraform #Azure #AzureDevOps #IaC #DevOps 
#CloudInfrastructure #Kubernetes #AKS #AzureSQL
#KeyVault #PrivateEndpoints #Monitoring #AzurePipelines
#EnterpriseArchitecture #CloudEngineering
```


