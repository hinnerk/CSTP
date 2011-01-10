maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "Installs Chromium"
version           "0.1.1"

recipe "google-chrome", "Installs Google Chrome"

%w{ debian ubuntu }.each do |os|
  supports os
end
