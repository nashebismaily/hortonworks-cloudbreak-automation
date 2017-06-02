default[:deployment_dir]			= "/opt/cloudbreak-deployment"
default[:blueprint_dir]                         = "/opt/cloudbreak-deployment/blueprints"
default[:sshkey_name]				= "sshkey"

default[:credential][:name]                    	= "aws-credential"
default[:credential][:description]             	= "awscredentials"
default[:credential][:roleArn]                 	= "aws:iam:role"
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

default[:securitygroup][:name]                  = "default-sg"
default[:securitygroup][:description]           = "sg description"
default[:securitygroup][:securityGroupId]       = "sg#"
default[:securitygroup][:publicInAccount]       = "0"
default[:securitygroup][:flags]                 = "--AWS --EXISTING"

default[:instancegroup][:numberHostGroups]	= 5
default[:instancegroup][:instanceGroup]	    	= ['host_group_master_1', 'host_group_master_2', 'host_group_master_3', 'host_group_client_1', 'host_group_slave_1']
default[:instancegroup][:nodeCounts]            = ['1', '1', '1', '1', '3']
default[:instancegroup][:templateName]    	= ['awstemplate', 'awstemplate', 'awstemplate', 'awstemplate', 'awstemplate']
default[:instancegroup][:securityGroupName]     = ['hdp-sg', 'hdp-sg', 'hdp-sg', 'hdp-sg', 'hdp-sg']
default[:instancegroup][:ambariServer]    	= ['true', 'fales', 'false', 'false', 'false']

default[:network][:name]			= "myVpc"
default[:network][:vpcID]			= "vpcId" 
default[:network][:subnetId]			= "subnetId"
default[:network][:flags]			= "--AWS --EXISTING_SUBNET"

default[:stack][:name]			    	= "stackHdp" 
default[:stack][:region]                       	= "us-east-1"
default[:stack][:wait]                         	= "true"
default[:stack][:flags]                        	= "--AWS"

default[:cluster][:description]                	= "hdpCluster"
default[:stack][:wait] 	                    	= "true"



