# cloudbreak-automation Cookbook

This cookbook will deploy the Hortonworks Data Platform on Amazon AWS using Cloudbreak by performing the following:

Assumptions made:
  1. Existing security groups will be used
  2. Existing subnet will be used

Automation Recipe/Template:
  1. Create a new sshkey for the cluster
  2. Create a credential
  3. Create a template
  4. Either select and existing cloudbreak blueprint or create a new cloudbreak blueprint from a provided json file
  5. Create a network on an existing subnet
  6. Create the stack
  7. Create the cluster

All parameters passed to the cloudbreak shell are made available through the default attributes. 
These attributes can be changed to further configure the cloudbreak cluster deploy.

TODO:
  1. Attribute validation (prevent user error on configurations)
  2. Option for blueprints pull from URL
  3. Make recipe work with new security groups
  4. Make recipe work with new networks


