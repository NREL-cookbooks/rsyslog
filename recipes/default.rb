#
# Cookbook Name:: rsyslog
# Recipe:: default
#
# Copyright 2011, NREL
#
# All rights reserved - Do Not Redistribute
#

package "rsyslog"

directory "/etc/rsyslog.d" do
  mode 0755
  owner "root"
  group "root"
  action :create
end

template "/etc/rsyslog.conf" do
  source "rsyslog.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[rsyslog]"
end

service "rsyslog" do
  supports :status => true, :restart => true
  action [:enable, :start]
end
