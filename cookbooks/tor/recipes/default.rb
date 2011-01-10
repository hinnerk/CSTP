#
# Cookbook Name:: tor
# Recipe:: default
#
# Copyright 2010, Hinnerk Haardt
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# define command for later use (chef 0.7.x requires this)
execute "apt-get update" do
  action :nothing
end

# add tor apt source definition and update packet cache
template "/etc/apt/sources.list.d/torproject.org.list" do
  mode "0644"
  source "torproject.org.list.erb"
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

# get gnupg for debian/ubuntu key checking
package "gnupg" do
  action :upgrade
end

# get gpg key from the tor project
execute "apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 886DDD89" do
  not_if "apt-key finger | grep 'A3C4 F0F9 79CA A22C DBA8  F512 EE8C BC9E 886D DD89'"
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

# install tor + poplio
%w{tor tor-geoipdb polipo}.each do |package|
  package package do
    action :upgrade
  end
end

# poplio port clashes with privoxy which sometimes seems to get installed
service "privoxy" do
  action :disable
end

# make sure polipo is running
service "polipo" do
  action :enable
end

# configure polipo
template "/etc/polipo/config" do
  mode "0644"
  source "etc.polipo.config.erb"
  notifies :restart, resources(:service => "polipo"), :immediately
end