#!/bin/bash
# IP address in environment "IP"
# Domain in environment "DOMAIN"
# Ansible inventory path in environment "INVENTORY_PATH"

# This test destroys a deployed project on the target server
# IMPORTANT: This must run after test_deploy.sh!

TEST=1 ansible-playbook stackhead-repo/ansible/application-destroy.yml -i "${INVENTORY_PATH}" --extra-vars "project_name=container" -vv
