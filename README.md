# vega-ansible
Ansible playbooks for managing Vega embedded Linux instances

# Usage
ssh-agent zsh
ssh-add ~/.ssh/vega-ansible
ansible -m ping -i hosts.yml -u pi all
ansible-playbook -i hosts.yml dashboard.yml
ansible-playbook -i hosts.yml vuosaari.yml
ansible-playbook -i hosts.yml santio.yml
