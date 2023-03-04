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
    - After playbook execution:
        - Run `systemctl dropboxd status`
        - Copy the link on the log into a browser
        - Authorize Dropbox use in the device (the one we installed)
- Dropbox only installs when using `--extra-vars "env=production"` to invoke the ansible-playbook
## Usage
    ./initial_setup.sh
## WSL2 Environment preparation
If you want to acess through a easy local dns (local.app.com) instead of localhost, run:

    ./environment-wsl/add_domains_to_hosts_file.ps1

To import Rocky Linux to your WSL2

    ./environment-wsl/import_rocky_linux_9_to_wsl.ps1