maintainer        "Ulrich Hoffmann"
maintainer_email  "uho@xlerb.de"
license           "Apache 2.0"
description       "Reenables Interface eth0"
version           "0.1"

recipe "ifup", "Reenables interface eth0"

%w{ debian ubuntu }.each do |os|
  supports os
end
