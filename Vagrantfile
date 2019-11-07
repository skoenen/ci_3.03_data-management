Vagrant.configure('2') do |config|
  config.vm.box = 'archlinux/archlinux'
  config.vm.network :forwarded_port, guest: 80, host: 1818

  config.vm.define 'database', primary: true do |dev_env|
    dev_env.vm.provision 'ansible_local' do |ansible|
      ansible.playbook = 'vagrant/playbooks/development_environment.yml'
    end
  end
end
