maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "Installs Tor"
version           "0.7.1"

recipe "tor", "Installs Tor privacy proxy"

%w{ redhat centos fedora ubuntu }.each do |os|
  supports os
end
