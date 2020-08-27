#!/bin/bash
# IP address in environment "IP"
# Domain in environment "DOMAIN"
INVENTORY_PATH=__tests__/inventory.yml

sed -e "s/\${ipaddress}/${IP}/" -e "s/\${webserver}/${WEBSERVER}/" __tests__/inventory.dist.yml > $INVENTORY_PATH

# Install dependencies
pip install -r requirements/pip.txt
ansible-galaxy install -r stackhead-repo/ansible/requirements/requirements.yml --force-with-deps

# Remove this role and set symlink
rm -rf "${HOME}/.ansible/roles/${ROLE_NAME}"
ln -s "$(pwd)" "${HOME}/.ansible/roles/${ROLE_NAME}"

# Provision server
TEST=1 ansible-playbook stackhead-repo/ansible/server-provision.yml -i "${INVENTORY_PATH}" -vv
