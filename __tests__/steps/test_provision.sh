#!/bin/bash
# IP address in environment "IP"
# Domain in environment "DOMAIN"
INVENTORY_PATH=__tests__/inventory.yml

# map webserver name to role name
if [ "$WEBSERVER" == 'caddy' ]; then WEBSERVER='getstackhead.stackhead_webserver_caddy'; fi

sed -e "s/\${ipaddress}/${IP}/" -e "s/\${webserver}/${WEBSERVER}/" __tests__/inventory.dist.yml > $INVENTORY_PATH

# Install dependencies
pip install -r requirements/pip.txt
ansible-galaxy install -r requirements/requirements.yml

# Provision server
TEST=1 ansible-playbook server-provision.yml -i "${INVENTORY_PATH}" -vv
