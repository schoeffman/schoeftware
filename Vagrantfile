# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-berkshelf"
Vagrant.require_plugin "vagrant-omnibus"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/code"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Plugins
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  # Network
  config.vm.network :forwarded_port, guest: 80, host: 8182
  config.vm.hostname = "schoeftware"

  # Chef solo provisioning
  config.vm.provision :chef_solo do |chef|

	#Database Info: N:siteDb U:root P:root

	chef.json = {
        	"mysql" => {
	    			"server_root_password" => "root",
    				"server_repl_password"=> "root",
    				"server_debian_password"=> "root",
               "remove_test_database" => "true",
               "bind_address" => "127.0.0.1",
               "dump_filename" => "dump.sql",
               "client" => {"packages" => ["mysql-client", "libmysqlclient-dev"]}
     		},
               "nginx" => { 	"default_site_enabled" => false,
               "source" => { "modules" => "./recipes/default/default.rb"}  
		   },
               "run_list" => [
               "recipe[mysql::client]",
               "recipe[mysql::server]",
               "recipe[php-fpm]",
               "recipe[peter::default]"]
       }

    chef.add_recipe "apt"     
    chef.add_recipe "php"
    chef.add_recipe "php-fpm"
    chef.add_recipe "mysql::client"
    chef.add_recipe "mysql::server"
    chef.add_recipe "database"
    chef.add_recipe "nginx"
    chef.add_recipe "configs"

  end
end
