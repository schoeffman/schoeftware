# -*- mode: ruby -*-
# vi: set ft=ruby :

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


  # Network
  config.vm.network :forwarded_port, guest: 80, host: 8182
  config.vm.hostname = "schoeftware"

  # Chef solo provisioning
  config.vm.provision :chef_solo do |chef|


	chef.cookbooks_path = ["cookbooks", "~/projects/opsworks-cookbooks"]
	#Database Info: N:siteDb U:root P:root

    chef.add_recipe "apt"
    chef.add_recipe "php"
    chef.add_recipe "php::module_apc"
    chef.add_recipe "php::module_curl"
    chef.add_recipe "php::module_gd"
    chef.add_recipe "php::module_mysql"  
    chef.add_recipe "php-fpm"
    chef.add_recipe "mysql::client"
    chef.add_recipe "mysql::server"
    chef.add_recipe "database"
    chef.add_recipe "apache2"

    #Specific for Vagrant / Development
    chef.add_recipe "configs::vagrantLink"
    chef.add_recipe "configs::mysql"

      
    chef.json = {
		"apache" => { "documentRoot" => "/srv/www/site"},
		"mysql" => {
	    			"server_root_password" => "zjjy04c23i",
     				"server_repl_password"=> "zjjy04c23i",
	   			"server_debian_password"=> "zjjy04c23i",
		         "remove_test_database" => "true",
	     			"bind_address" => "127.0.0.1",
		         "dump_filename" => "dump.sql",
		   		"projectRoot" => "/home/vagrant/code/",
	     			"client" => {"packages" => ["libapache2-mod-php5", "mysql-client", "libmysqlclient-dev"]}
		}
     }

  end
end
#/srv/www/wordpress/current
# abandon opsworks plans just use capastrano and berfksfile...also try removeing the other cookbooks
