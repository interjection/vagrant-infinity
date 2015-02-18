# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

current_dir = File.expand_path(File.dirname(__FILE__))

infinity_dir = File.join(current_dir, 'infinity')
infinity_install = File.join(infinity_dir, '.installed')

machine_dir = File.join(current_dir, '.vagrant', 'machines', 'infinity')
machine_id = File.join(machine_dir, 'virtualbox', 'id')

if ! Dir.exists?(infinity_dir)
  Dir.mkdir(infinity_dir)
end

if File.exists?(infinity_install) && ! File.exists?(machine_id)
  File.delete(infinity_install)
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "infinity"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  config.vm.synced_folder "salt/roots/salt/", "/srv/salt/"
  config.vm.synced_folder "salt/roots/pillar/", "/srv/pillar/"
  config.vm.synced_folder "infinity/", "/srv/infinity/", group: "www-data", :mount_options => ["dmode=775","fmode=775"]

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = "box"
  end

  config.vm.provision "salt" do |salt|
    salt.minion_config = "salt/minion.conf"
    salt.run_highstate = true

    salt.install_type = "stable"
    #salt.install_args = "v2014.7.1"

    salt.verbose = "true"
    salt.colorize = "true"
    salt.log_level = "warning"
  end

  config.vm.provider "virtualbox" do |override|
    override.customize ["modifyvm", :id, "--memory", 512]
  end

end
