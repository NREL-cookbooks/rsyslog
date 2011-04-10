#
# Cookbook Name:: rsyslog
# Recipe:: default
#
# Copyright 2011, NREL
#
# All rights reserved - Do Not Redistribute
#

package "rsyslog" do
  action :upgrade
end

template "/etc/rsyslog.conf" do
  source "rsyslog.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :reload, "service[rsyslog]"
end

service "rsyslog" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
