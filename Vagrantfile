require "vagrantplugins/webbrowser"


Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.
  config.vm.define :router do |router_config|
    router_config.vm.box = "lucid32_minbase"
    router_config.vm.network("192.168.23.10")
    router_config.vm.provisioner = :chef_solo
    router_config.chef.cookbooks_path = "cookbooks"
    router_config.vm.customize do |vm|
      vm.memory_size = 128
      vm.name = "TOR Router VM"
    end
    router_config.chef.add_recipe("router")
  end

  config.vm.define :desktop do |desktop_config|
    desktop_config.vm.box = "lucid32_minbase"
    desktop_config.vm.network("192.168.23.15")
    desktop_config.ssh.host = "192.168.23.15"
    desktop_config.ssh.port = "22"
    desktop_config.ssh.forwarded_port_key = "nixda"
    # desktop_config.vm.forward_port("ssh",22,2222, {:auto => true, :adapter => 0})
    desktop_config.vm.provisioner = :chef_solo
    desktop_config.chef.cookbooks_path = "cookbooks"
    desktop_config.vm.customize do |vm|
      vm.memory_size = 128
      vm.name = "TOR Desktop VM"
    end
    desktop_config.chef.add_recipe("desktop")

  end

end
