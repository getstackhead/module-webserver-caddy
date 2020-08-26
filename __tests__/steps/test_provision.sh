#!/bin/bash
# IP address in environment "IP"
# Domain in environment "DOMAIN"
INVENTORY_PATH=__tests__/inventory.yml

# map webserver name to role name
if [ "$WEBSERVER" == 'caddy' ]; then WEBSERVER='getstackhead.stackhead_webserver_caddy'; fi

sed -e "s/\${ipaddress}/${IP}/" -e "s/\${webserver}/${WEBSERVER}/" __tests__/inventory.dist.yml > $INVENTORY_PATH

# Install dependencies
pip install -r requirements/pip.txt
ansible-galaxy install -r stackhead-repo/ansible/requirements/requirements.yml --force-with-deps

# Remove this role and set symlink
rm -rf ~/.ansible/roles/getstackhead.stackhead_webserver_caddy
ln -s "$(pwd)" ~/.ansible/roles/getstackhead.stackhead_webserver_caddy

# Provision server
TEST=1 ansible-playbook stackhead-repo/ansible/server-provision.yml -i "${INVENTORY_PATH}" -vv
