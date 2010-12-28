maintainer        "Hinnerk Haardt"
maintainer_email  "hinnerk@randnotizen.de"
license           "Apache 2.0"
description       "Updates apt packages"
version           "0.9.1"
recipe            "apt", "Runs apt-get update during compile phase"

%w{ ubuntu debian }.each do |os|
  supports os
end
