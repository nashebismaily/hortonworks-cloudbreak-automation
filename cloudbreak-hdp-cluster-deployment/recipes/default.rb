#
# Cookbook Name:: cloudbreak-automation
# Recipe:: node
#
# Copyright 2017
#
# Author::  Nasheb Ismaily
#
# All rights reserved - Do Not Redistribute
#

execute 'cb_create_ssh_key' do
  command "ssh-keygen -b 2048 -t rsa -f #{ node[:deployment_dir] }/#{ node[:sshkey_name] } -q -N ''"
end

template "deploy_cluster" do
  path "#{node[:deployment_dir]}/deploy_cluster"
  source "deploy_cluster.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
	:instance_count			=> node["instancegroup"]["numberHostGroups"], 
	:deployment_dir 		=> node[:deployment_dir],
	:blueprint_dir 			=> node[:blueprint_dir],
		
	:credential_name 		=> node[:credential][:name],
	:credential_description 	=> node[:credential][:description],
	:credential_roleArn 		=> node[:credential][:roleArn],
	:credential_sshKeyPath 		=> node[:credential][:sshKeyPath],
	:credential_flags 		=> node[:credential][:flags],
		
	:template_cbName		=> node[:template][:cbName],
	:template_description		=> node[:template][:description],
	:template_instanceType		=> node[:template][:instanceType],
	:template_volumeSize		=> node[:template][:volumeSize],
	:template_volumeCount		=> node[:template][:volumeCount],
	:template_flags			=> node[:template][:flags],
		
	:blueprint_createNew		=> node[:blueprint][:createNew],
	:blueprint_name			=> node[:blueprint][:name],
	:blueprint_description		=> node[:blueprint][:description],
	:blueprint_file			=> node[:blueprint][:file],
		
	:securitygroup_name		=> node[:securitygroup][:name],
	:securitygroup_description	=> node[:securitygroup][:description],
	:securitygroup_securityGroupId	=> node[:securitygroup][:securityGroupId],
	:securitygroup_publicInAccount	=> node[:securitygroup][:publicInAccount],
	:securitygroup_flags		=> node[:securitygroup][:flags],
		
	:instancegroup_numberHostGroups	=> node["instancegroup"]["numberHostGroups"],
	:instancegroup_numberHostGroups	=> node[:instancegroup][:instanceGroup],
	:instancegroup_nodeCounts	=> node[:instancegroup][:nodeCounts],
	:instancegroup_templateName	=> node[:instancegroup][:templateName],
	:instancegroup_securityGroupName=> node[:instancegroup][:securityGroupName],
	:instancegroup_ambariServer	=> node[:instancegroup][:ambariServer],

	:network_name			=> node[:network][:name],
	:network_vpcId			=> node[:network][:vpcID],
	:network_subnetId		=> node[:network][:subnetId],
	:network_flags			=> node[:network][:flags],
		
	:stack_name			=> node[:stack][:name],
	:stack_region			=> node[:stack][:region],
	:stack_wait			=> node[:stack][:wait],
	:stack_flags			=> node[:stack][:flags],
		
	:cluster_description		=> node[:cluster][:description],
		
	:stack_wait			=>node[:stack][:wait]
 	)
end

execute 'cb_create_cluster' do
  command "cd #{ node[:deployment_dir] }; cbd util cloudbreak-shell-quiet <  #{ node[:deployment_dir]}/deployCluster"
end

