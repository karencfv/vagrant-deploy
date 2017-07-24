# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.define "deploy", primary: true do |subconfig|
    subconfig.vm.hostname = "deploy"
    subconfig.vm.network :private_network, ip: "10.0.0.10"
    subconfig.vm.network "forwarded_port",
                          guest: 80,
                          host: 8000,
                          auto_correct: true
    subconfig.vm.synced_folder ".", "/var/www"
    # Specified vagrant to not run in sudo mode so rbenv is installed in the right path -> ~/ rather than /root/.
    subconfig.vm.provision "shell", privileged: false, path: "prod.sh"
    subconfig.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end

  config.vm.define "uat", autostart: false do |subconfig|
    subconfig.vm.hostname = "uat"
    subconfig.vm.network :private_network, ip: "10.0.0.11"
    subconfig.vm.network "forwarded_port", guest: 80, host: 8001, auto_correct: true
    # Specified vagrant to not run in sudo mode so rbenv is installed in the right path -> ~/ rather than /root/.
    subconfig.vm.provision "shell", privileged: false, path: "prod.sh"
    subconfig.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end
end
