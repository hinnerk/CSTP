maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "Adds a global default proxy"
version           "0.1.1"

recipe "global-proxy", "Adds a global proxy"

%w{ debian ubuntu }.each do |os|
  supports os
end
