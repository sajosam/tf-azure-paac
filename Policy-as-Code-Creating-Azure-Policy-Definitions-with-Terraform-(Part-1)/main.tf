
locals {

  # Load policy definition data from a CSV file and convert it into a list
  policy_definition_file = csvdecode(file("${path.root}/definition/def-policy-csv/policyname.csv"))

  # Convert policy definition files to JSON format for Terraform use
  policy_data={for name,file in data.local_file.definition_file : name => jsondecode(file.content)}
}

# ----------------------------
# Policy Definition Data Sources
# ----------------------------
# This data resource dynamically loads JSON files based on the policy IDs defined in the CSV file.
data "local_file" "definition_file"{
  for_each = {for n,v in local.policy_definition_file: n=>v}
  filename = "${path.root}/definition/${each.value.policy_ids}.json"
}


# ----------------------------
# Policy Definition Module
# ----------------------------
# Creates Azure policies from JSON definitions at management group level

module "policy_def" {
  source = "./modules/definition"
  policy_definition=local.policy_data
  management_group_id = var.management_group_id
}
