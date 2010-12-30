maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "Installs a Tor Server"
version           "0.0.1"

recipe "router", "Installs Tor privacy proxy server"

%w{ redhat centos fedora ubuntu }.each do |os|
  supports os
end
