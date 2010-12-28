require "vagrantplugins/firefox"


Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.
  config.vm.define :router do |router_config|
    router_config.vm.box = "lucid32_minbase"
    # router_config.vm.forward_port("http", 80, 8080)
    router_config.vm.network("192.168.23.10")
    router_config.vm.provisioner = :chef_solo
    router_config.chef.cookbooks_path = "cookbooks"
    router_config.vm.customize do |vm|
      vm.memory_size = 128
      vm.name = "TOR Router VM"
    end
    #
    # Recipes, for now added direct instead via a meta recipe.
    router_config.chef.run_list.clear
    router_config.chef.add_recipe("apt")
    #router_config.chef.add_recipe("tor")
  end

  config.vm.define :desktop do |desktop_config|
    desktop_config.vm.box = "lucid32_minbase"
    # desktop_config.vm.forward_port("db", 3306, 3306)
    desktop_config.vm.network("192.168.23.15")
    desktop_config.vm.provisioner = :chef_solo
    desktop_config.chef.cookbooks_path = "cookbooks"
    desktop_config.vm.customize do |vm|
      vm.memory_size = 128
      vm.name = "TOR Desktop VM"
    end
    #
    # Recipes, for now added direct instead via a meta recipe.
    desktop_config.chef.run_list.clear
    desktop_config.chef.add_recipe("apt")
    # desktop_config.chef.add_recipe("firefox")
    desktop_config.chef.add_recipe("chromium-browser")

  end

end
