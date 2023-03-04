#!/bin/sh
dnf install -y sudo git ansible-core
alias ll="ls -l"
adduser nginx
cd /home/nginx/
mkdir /srv/git/ /srv/http/
chown -R nginx:nginx .ssh /srv/ /srv/git /srv/http/
cd /srv/git/
sudo -u nginx bash << EOF
git clone https://github.com/max171/ansible-lemp-with-auto-backup-for-rhel.git
EOF
ansible-galaxy install -r /srv/git/ansible-lemp-with-auto-backup-for-rhel/requirements.yml
ansible-playbook -v /srv/git/ansible-lemp-with-auto-backup-for-rhel/configure_server.yml