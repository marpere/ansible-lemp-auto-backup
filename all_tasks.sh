#!/bin/sh
ansible-playbook -v configure_server.yml --extra-vars "env=development"