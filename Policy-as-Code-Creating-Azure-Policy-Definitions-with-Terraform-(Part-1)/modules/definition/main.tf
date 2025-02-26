# ----------------------------------------------------------------------------
# This file defines Azure Policy Definitions using the 'azurerm' provider.
# It creates custom policy definitions based on the provided configuration.
# ----------------------------------------------------------------------------

# Create Azure Policy Definitions
resource "azurerm_policy_definition" "policy" {
  for_each = { for k, v in var.policy_definition : k => v } # Iterate over each policy definition in the 'policy_definition' variable

  # Required attributes for the policy definition
  name         = each.value.metadata.slug # The name of the policy definition (taken from the 'slug' in the metadata)
  policy_type  = "Custom"                 # The type of policy definition (set to "Custom")
  mode         = each.value.mode         # The mode of the policy definition (e.g., "Indexed", "All")
  display_name = each.value.displayName  # The display name of the policy definition

  # Optional attributes for the policy definition
  description  = each.value.description  # A description of the policy definition
  metadata     = jsonencode(each.value.metadata) # Metadata associated with the policy definition
  policy_rule  = jsonencode(each.value.policyRule) # The policy rule that defines the logic of the policy
  management_group_id = var.management_group_id != "" ? var.management_group_id : null # The ID of the management group where the policy definition is created (optional)
  parameters   = contains(keys(each.value), "parameters") ? jsonencode(each.value.parameters) : null # Parameters for the policy definition (optional)
}

# Output the policy definition IDs
output "policy_definition_ids" {
  value = { for k, v in azurerm_policy_definition.policy : jsondecode(v.metadata).slug => v.id } # Create a map of policy slugs to policy definition IDs
}
