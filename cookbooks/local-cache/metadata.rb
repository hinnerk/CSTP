maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "adds local cache to apt configuration"
version           "0.0.01"
recipe            "local-cache", "Adds a local cache to apt-configuration"

%w{ ubuntu debian }.each do |os|
  supports os
end
