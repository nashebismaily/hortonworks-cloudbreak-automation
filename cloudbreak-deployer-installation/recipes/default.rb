#
# Cookbook Name:: cloudbreak-deployment
# Recipe:: default
#
# Copyright 2017
#
# Author: Nasheb Ismaily
#
# All rights reserved - Do Not Redistribute
#

execute 'update_repositories' do
  command 'yum -y update'
end

execute 'install_utilities' do
  command 'yum -y install net-tools ntp wget lsof unzip tar iptables-services'
end

service 'ntp' do
  action :start
end

service 'ntp' do
 supports :restart => true
 action :enable
end

service 'firewalld' do
  action :stop
end

service 'firewalld' do
 action :disable
end

execute 'flust_iptable_rules' do
  command 'iptables --flush INPUT && sudo iptables --flush FORWARD && sudo service iptables save'
end

execute 'disable_selinux' do
  command "sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux"
end

template "docker_repo" do
  path "/etc/yum.repos.d/docker.repo"
  source "docker.repo.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :docker_base_url		=> node[:docker][:url],
    :docker_gpg_key		=> node[:docker][:gpgkey]
  )
end

execute 'install_docker' do
  command 'yum -y install docker-engine-1.9.1 docker-engine-selinux-1.9.1'
end

service 'docker' do
  action :start
end

service 'docker' do
 supports :restart => true
 action :enable
end

execute 'install_cloudbreak_deployer' do
  command 'curl -Ls s3.amazonaws.com/public-repo-1.hortonworks.com/HDP/cloudbreak/cloudbreak-deployer_1.14.5-rc.2_$(uname)_x86_64.tgz | tar -xz -C /bin cbd'
end

execute 'create_cloudbreak_appliction_dir' do
  command 'cd /opt; mkdir cloudbreak-deployment; cd cloudbreak-deployment'
end

template "Profile" do
  path "/opt/cloudbreak-deployment/Profile"
  source "Profile.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :uaa_default_secret			=> node[:profile][:default_secret], 
    :uaa_default_user_email		=> node[:profile][:user_email],
    :uaa_default_user_pw		=> node[:profile][:user_pw],
    :public_ip				=> node[:profile][:public_ip],
    :cloudbreak_smtp_sender_username	=> node[:profile][:sender_username],
    :cloudbreak_smtp_sender_password    => node[:profile][:sender_password],
    :cloudbreak_smtp_sender_host    	=> node[:profile][:sender_host],
    :cloudbreak_smtp_port		=> node[:profile][:sender_port],
    :cloudbreak_smtp_sender_from    	=> node[:profile][:sender_from],
    :cloudbreak_smtp_auth		=> node[:profile][:smtp_auth],
    :cloudbreak_smtp_starttls_enable    => node[:profile][:smtp_starttls_enable],
    :cloudbreak_smtp_type		=> node[:profile][:smtp_type],
  )
end

execute 'initialize_cloudbreak' do
  command 'cd /opt/cloudbreak-deployment; cbd generate'
end

execute 'pull_cloudbreak' do
  command 'cbd pull'
end

execute 'start_cloudbreak' do
  command 'cbd start'
end


