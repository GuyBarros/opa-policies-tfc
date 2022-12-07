policy "no_deploys_weekend" {
  query = "data.terraform.policies.weekend_deploys.deny"
  enforcement_level = "advisory"
}

# policy "vm_region_enforcement" {
#   query = "data.terraform.policies.vm_region_enforcement.deny"
#   enforcement_level = "advisory"
# }

# policy "tfc_agent_public_ip" {
#   query = "data.terraform.policies.agent_public_ip.deny"
#   enforcement_level = "advisory"
# }

# policy "subnet_region_enforcement" {
#   query = "data.terraform.policies.subnet_region_enforcement.deny"
#   enforcement_level = "advisory"
# }

  policy "check_modules_pmr" {
   query = "data.terraform.policies.check_modules_pmr.deny"
   enforcement_level = "advisory"
 }