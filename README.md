# vega-ansible
Ansible playbooks for managing Vega embedded Linux instances

# Usage
pipenv shell
ssh-agent zsh
ssh-add ~/.ssh/vega-ansible
ansible -m ping -i hosts.yaml -u pi all