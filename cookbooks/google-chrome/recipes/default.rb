#
# Cookbook Name:: google-chrome
# Recipe:: default
#
# Copyright 2011, Hinnerk Haardt.
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
template "/etc/apt/sources.list.d/google.com.list" do
  mode "0644"
  source "google.com.list.erb"
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

# make sure gnupg & curl for debian/ubuntu key checking are available
%w{gnupg curl}.each do |pack|
  package pack do
    action :upgrade
  end
end

# get gpg key from the tor project
execute "curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -" do
  not_if "apt-key finger | grep '4CCA 1EAF 950C EE4A B839  76DC A040 830F 7FAC 5991'"
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

# install chrome

package "google-chrome-unstable" do
  action :upgrade
end

