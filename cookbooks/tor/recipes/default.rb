#
# Cookbook Name:: screen
# Recipe:: default
#
# Copyright 2008-2009, Opscode, Inc.
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

package "tor" do
  action :install
end

## TODO:
# Add the security key with this command:
# => gpg --keyserver keys.gnupg.net --recv 886DDD89 && gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
# Add to /etc/apt/sources.list
# => deb http://deb.torproject.org/torproject.org lucid main
# => deb-src http://deb.torproject.org/torproject.org lucid main
# reload packages & install TOR + Privoxy|Poplio
# => sudo apt-get upgrade
# => sudo apt-get update
# => sudo apt-get install tor tor-geoipdb
# => sudo apt-get install privoxy
# add the following line to /etc/privoxy/config: 
# => forward-socks4a / localhost:9050 .