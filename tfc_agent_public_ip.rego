package terraform.policies.agent_public_ip

import input.plan as tfplan

deny[msg] {
  # Extract resource changes from the plan
  r := tfplan.resource_changes[_]
  
  # Filter for GCP instances
  r.type == "google_compute_instance"

  # Filter for instances named tfc-agent
  r.name == "tfc-agent"

  # RULE TRIGGER - Compliant instances should not have a public IP assigned
  r.change.after.network_interface[0].access_config[0].nat_ip != ""

  # IF TRIGGER print the following message
  msg := sprintf("The instance %v is associated with a public IP and that is a security risk", [r.change.after.name])
}