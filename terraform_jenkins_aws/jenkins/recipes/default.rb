#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_repository "jenkins" do
  uri "ppa:webupd8team/java"
  action :add
end

execute 'apt update' do
  command 'sudo apt update'
end

apt_package 'oracle-java8-installer'

apt_repository "jenkins" do
  uri "http://pkg.jenkins-ci.org/debian"
  key "http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key"
  components ["binary/"]
  action :add
end

package "jenkins"

service "jenkins" do
  supports [:stop, :start, :restart]
  action [:start, :enable]
end
