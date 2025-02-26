# ------------------------------------------------------------------------------------------------
# Define input variables for the policy definition module.
# These variables are used to configure and customize the creation of Azure Policy Definitions.
# ------------------------------------------------------------------------------------------------

# Variable for the policy definition data.
# This variable accepts a map of policy definitions, where each key represents a unique policy and the value contains the policy configuration.
variable "policy_definition" {}

# Variable for the management group ID.
# This variable specifies the ID of the management group where the policy definitions will be created. If not provided, the policy definitions will be created at the subscription level.
variable "management_group_id" {}
