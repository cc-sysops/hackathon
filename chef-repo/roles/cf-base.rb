name "cf-base"
description "CloudFoundry Base Role - Installs everything for a single node install"
run_list(
  "role[nats]",
  "role[cloudfoundry]",
  "role[cf-router]",
  "role[ccdb]",
  "role[cloud_controller]",
  "role[health_manager]",
  "role[cf-dea]",
  "role[cf-redis]",
  "role[cf-mysql]",
  "role[cf-mongodb]",
  "role[redis_gateway]",
  "role[mysql_gateway]",
  "role[mongodb_gateway]"
)
override_attributes(
	"cloudfoundry" => {
		"home" => "/home/hackday"
	},
	"jobs" => {
		"install" => {	"all" => nil },
		"installed" => nil
	},
  "deployment" => {"group" => "1000","name" => "devbox","user" => "hackday"},
  "services" => ["redis","mysql","mongodb","postgresql"]
)