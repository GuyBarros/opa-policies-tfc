package terraform.policies.vm_region_enforcement

import input.plan as tfplan

deny[msg] {
  r := tfplan.resource_changes[_]
  r.type == "google_compute_instance"
  r.change.after.zone != "europe-west1-c"
  msg := sprintf("%v is being deployed in %v that is not approved", [r.address, r.change.after.zone])
}