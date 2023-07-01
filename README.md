# Ansible LEMP with DB auto backup
Configure LEMP Stack + daily Dropbox backup for the MariaDB schemas
## LEMP Stack
- (L) Linux - Supports RHEL 8 and 9 (CentOS, Rocky, Alma)
- (E) NGINX  - Latest version in AppStream repo. Configured to PHP-FPM over socket
- (M) MariaDB - Latest version in AppStream repo. Secure installation
- (P) PHP - 8.1 from Remi repo. PHP + FPM + Opcache
## Dropbox auto backup
- Dropbox CLI installation
- Daily crontab dumps the database into the synced Dropbox directory
- Deletes dumps older than 30 days (can be personalized) to avoid the Dropbox account to reach its limit
- Steps to activate Dropbox on CLI
    - After playbook execution:
        - Run `systemctl status dropbox`
        - In the logs showed will have a Dropbox link
        - Access the link into a browser
        - Authorize Dropbox use in the device
## Configurations

`./vars/all.yml`

## Playbook usage
1. Auto Download
    - Copy and paste the commands of the file `./initial_setup.sh` into the terminal
        - It will GIT clone and run the ansible playbook

2. Manual Download
    - Create user `nginx` and the directories `/srv/git/` and `/srv/http/`
    - GIT clone the project into `/srv/git/`
    - Run the playbook with the script `./run_tasks.sh`
## Playbook usage in WSL2
Before run the playbook, create the Rocky Linux 9 distribution with the Powershell script:

    ./environment-wsl/import_rocky_linux_9_to_wsl.ps1

It will download the distro in the first time it executes.

### Requirements to run in WSL2:
    WSL2  - Microsoft Store version - Updates: Windows 10(KB5020030) or Windows 11(KB5019157). 
    Prior versions of the WSL don't allow systemd.
## Test

Access http://localhost or the equivalent DNS of the machine, you should see the phpinfo page
