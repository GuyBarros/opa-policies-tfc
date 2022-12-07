package terraform.policies.check_modules_pmr

import input.plan as tfplan
#import input.config as tfconfig

deny[msg] {
	module_sources := tfplan.configuration.root_module.module_calls[_].source
	pmr_address := "app.terraform.io/emea-se-playground-2019"
	#source := concat("/", [tf_host, organization])
	not contains(module_sources, pmr_address)
	msg := sprintf("Module %v is not coming from the Private Registry, this is not a best practice.", [module_sources])
}
