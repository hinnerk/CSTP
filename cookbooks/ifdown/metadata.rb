maintainer        "Ulrich Hoffmann"
maintainer_email  "uho@xlerb.de"
license           "Apache 2.0"
description       "Removes Interface eth0"
version           "0.1"

recipe "ifdown", "Removes Interface eth0"

%w{ redhat centos fedora ubuntu }.each do |os|
  supports os
end
