maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "Installs Firefox"
version           "0.7.1"

recipe "firefox", "Installs Firefox"

%w{ redhat centos fedora ubuntu }.each do |os|
  supports os
end
