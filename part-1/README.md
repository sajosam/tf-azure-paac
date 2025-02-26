# Terraform Azure Policy Deployment Guide

This guide outlines the step-by-step procedure to define and deploy Azure Policy definitions using Terraform.

---

## 1. Configure `terraform.tfvars`

- Define the following variables in the `terraform.tfvars` file:
  - `client_id`
  - `client_secret`
  - `tenant_id`
  - `subscription_id`
  - `management_group_id` (specifies the management group level for policy application)

---

## 2. Define Policy Definition JSON

### Steps:
1. Navigate to the `definition/` directory.
2. Create a JSON file for the policy definition, ensuring the file name matches the policy name. Use hyphens (`-`) or underscores (`_`) instead of spaces.
3. Add the policy name to the `def-policy-csv/policyname.csv` file.
4. In each policy definition's metadata, add a `slug` field, which should contain the filename without `.json` to enable policy mapping.

### Example Format:
```csv
policy_ids
enforce-mandatory-tags-for-resource-groups
enforce-mandatory-tags-for-virtual-machines
```
---
