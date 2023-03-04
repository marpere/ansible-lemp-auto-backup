#!/bin/sh
ansible-playbook -v configure_server.yml --tags current --extra-vars "env=development"