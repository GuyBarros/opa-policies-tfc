opa eval --input tfplan.json --data weekend_deploys.rego "data.terraform.policies.weekend_deploys"
opa eval --input tfplan.json --data tfc_agent_public_ip.rego "data.terraform.policies.agent_public_ip"

