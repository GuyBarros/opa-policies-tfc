package terraform.policies.subnet_region_enforcement

import input.plan as tfplan

deny[msg] {
  r := tfplan.resource_changes[_]
  r.type == "google_compute_subnetwork"
  allowed_regions := [["europe-west1"],["europe-west2"]]
  #input.regions = allowed_regions[_]
  #r.name == "tfc-agent"
  #r.change.after.region != allowed_region
  #r.change.after.region != allowed_regions[_]
  #allowed_regions == r.change.after.region
  r.change.after.region = allowed_regions[_]
  not contains_region(allowed_regions,r.change.after.region)
  msg := sprintf("%v could not be deployed as %v is not in the allowed regions", [r.address, r.change.after.region])
}

contains_region(arr,val){
    arr[_] == val
}