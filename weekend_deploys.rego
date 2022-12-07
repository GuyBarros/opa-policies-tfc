package terraform.policies.weekend_deploys


deny[msg] {
  time.weekday(time.now_ns()) == "Wednesday"
  msg := sprintf("No deployments allowed on %v",[time.weekday(time.now_ns())])
}

deny2[msg] {
  time.weekday(time.now_ns()) == "Sunday"
  msg := sprintf("No deployments allowed on %v",[time.weekday(time.now_ns())])
}

# To test this policy - opa eval --input tfplan.json --data weekend_deploys.rego "data.terraform.policies.weekend_deploys.deny"