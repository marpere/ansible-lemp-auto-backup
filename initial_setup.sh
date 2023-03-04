#!/bin/sh
dnf install -y sudo git ansible-core
alias ll="ls -l"
adduser nginx
cd /home/nginx/
mkdir /srv/git/ /srv/http/
chown -R nginx:nginx /srv/ /srv/git /srv/http/
cd /srv/git/
sudo -u nginx bash << EOF
git clone https://github.com/max171/ansible-lemp-auto-backup.git
EOF
ansible-galaxy install -r /srv/git/ansible-lemp-auto-backup/requirements.yml
ansible-playbook -v /srv/git/ansible-lemp-auto-backup/configure_server.yml