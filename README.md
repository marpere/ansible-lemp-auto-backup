# ansible-lemp-with-auto-backup-for-rhel
Configure LEMP Stack + daily Dropbox auto backup for the DB using Ansible
## Supported OSs
- RHEL 8 (CentOS, Rocky, Alma)
- RHEL 9 (CentOS Stream, Rocky, Alma)
## LEMP Stack
- (L) Linux (RHEL 8 or 9. VPS, WSL2 or Docker)
- (E) NGINX (Latest in AppStream repo. Configured to PHP-FPM over socket)
- (M) MariaDB (Latest in AppStream repo. Secured installation)
- (P) PHP (8.1 from Remi repo. PHP + FPM + Opcache)
## Auto backup
- Dropbox CLI installation
- Daily crontab dumps the database into the synced Dropbox directory
- Deletes dumps older than 30 days (can be personalized) to avoid the Dropbox account to reach its limit
- Steps to activate Dropbox on CLI
    - After finish script
## Usage
    ansible-galaxy install -r ./requirements.yml
    ansible-playbook -v ./configure_server.yml --extra-vars "env=development"
## WSL2 Usage
To add domains to your Windows hosts file run:

    ./environment-wsl/add_domains_to_hosts_file.ps1
To donwload WSL2 Rocky Linux 9 and start and Distribution run:

    ./import_rocky_linux_9_to_wsl.ps1