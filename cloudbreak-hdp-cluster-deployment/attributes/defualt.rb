default[:deployment_dir]			= "/opt/cloudbreak-deployment"
default[:blueprint_dir]                         = "./blueprints"
default[:sshkey_name]				= "sshkey"

default[:credential][:name]                    	= "cmd-aws-credential"
default[:credential][:description]             	= "cmdcredentials"
default[:credential][:roleArn]                 	= "myrole"
default[:credential][:sshKeyPath]              	= "sshkey.pub"
default[:credential][:flags]		    	= "--AWS"

default[:template][:cbName]                	= "awstemplate"
default[:template][:description]                = "aws-template"
default[:template][:instanceType]               = "m4.large"
default[:template][:volumeSize]                 = "100"
default[:template][:volumeCount]                = "2"
default[:template][:flags] 		    	= "--AWS"

default[:blueprint][:createNew]                 = "false" 
default[:blueprint][:name]	               	= "testblueprint"
default[:blueprint][:description]               = "test-blueprint"
default[:blueprint][:file]                      = "testblueprint.json"

default[:securitygroup][:name]                  = "sg"
default[:securitygroup][:description]           = "sg-description"
default[:securitygroup][:securityGroupId]       = "sg-Id"
default[:securitygroup][:publicInAccount]       = "0"
default[:securitygroup][:flags]                 = "--AWS --EXISTING"

default[:instancegroup][:numberHostGroups]	= 3
default[:instancegroup][:instanceGroup]	    	= ['host_group_master_1', 'host_group_client_1', 'host_group_slave_1']
default[:instancegroup][:nodeCounts]            = ['1', '1', '1']
default[:instancegroup][:templateName]    	= ['awstemplate', 'awstemplate', 'awstemplate']
default[:instancegroup][:securityGroupName]     = ['sg', 'sg', 'sg']
default[:instancegroup][:ambariServer]    	= ['true', 'false', 'false']

default[:network][:name]			= "vpc"
default[:network][:vpcID]			= "vpc-Id" 
default[:network][:subnetId]			= "subnet-Id"
default[:network][:flags]			= "--AWS --EXISTING_SUBNET"

default[:stack][:name]			    	= "hdpstack" 
default[:stack][:region]                       	= "us-east-1"
default[:stack][:wait]                         	= "true"
default[:stack][:flags]                        	= "--AWS"

default[:cluster][:description]                	= "hdp-cluster"
default[:stack][:wait] 	                    	= "true"



