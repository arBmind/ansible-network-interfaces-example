# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative '.vagrant-file' if File.exists?('.vagrant-file.rb')

Vagrant.configure('2') do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder ".", "/vagrant", disabled: true # only ansible-vm mounts
  config.ssh.insert_key = false

  # use vagrant-hostmanager plugin
  #   vagrant plugin install vagrant-hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
    if vm.id
      `VBoxManage guestproperty get #{vm.id} "/VirtualBox/GuestInfo/Net/1/V4/IP"`.split()[1]
    end
  end

  config.vm.define "network-interfaces-vm" do |network|
    network.vm.hostname = "network-interfaces-vm"
  end

  config.vm.define "ansible-vm", primary: true do |ansible|
    ansible.vm.hostname = "ansible-vm"
    ansible.vm.synced_folder ".", "/vagrant", :mount_options => ["fmode=666"]
    ansible.ssh.forward_agent = true
    customize_ansible_vm(ansible) if defined? customize_ansible_vm
  end
end
