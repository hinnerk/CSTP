maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "Installs Chromium"
version           "0.7.1"

recipe "chromium-browser", "Installs Chromium"

%w{ redhat centos fedora ubuntu }.each do |os|
  supports os
end
