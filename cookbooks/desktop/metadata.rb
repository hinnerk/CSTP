maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "Installs a Desktop Server"
version           "0.0.1"

recipe "desktop", "Installs a remote desktop server to be connected to a Tor privacy proxy server"

%w{ redhat centos fedora ubuntu }.each do |os|
  supports os
end
